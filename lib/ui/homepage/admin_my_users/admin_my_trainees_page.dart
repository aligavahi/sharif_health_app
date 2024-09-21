import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharif_health_app/model/homepage/admin_my_users/admin_my_users_cubit.dart';
import 'package:sharif_health_app/model/homepage/my_trainers/my_trainers_cubit.dart';
import 'package:sharif_health_app/ui/homepage/admin_my_users/admin_user_detail.dart';
import 'package:sharif_health_app/ui/homepage/admin_my_users/admin_user_permission.dart';
import 'package:sharif_health_app/utils/app_colors.dart';

class AdminMyTraineesPage extends StatelessWidget {
  const AdminMyTraineesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AdminMyUsersCubit>(
        create: (BuildContext context) => AdminMyUsersCubit(),
        child: BlocConsumer<AdminMyUsersCubit, AdminMyUsersState>(
            listener: (context, state) {
          if (state is AdminMyUsersChangePermission) {
            if (state.dialogIsDown) {
              var cubit = BlocProvider.of<AdminMyUsersCubit>(context);
              showDialog(
                  context: context,
                  builder: (innerContext) => BlocProvider.value(
                      value: context.watch<AdminMyUsersCubit>(),
                      child: BlocBuilder<AdminMyUsersCubit, AdminMyUsersState>(
                          builder: (context, state) {
                        if (state is AdminMyUsersChangePermission) {
                          return AdminUserPermission(
                            cubit: cubit,
                          );
                        }
                        Navigator.of(context).pop();
                        return Text("loading");
                      })));
            }
          }
        }, builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.background,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              leading: (state is AdminMyUsersInitial
                  ? null
                  : InkWell(
                      child: const Icon(Icons.arrow_back),
                      onTap: () =>
                          BlocProvider.of<AdminMyUsersCubit>(context).goBack(),
                    )),
              title: const Center(
                child: Text("کاربران من"),
              ),
            ),
            body: getBody(state, context),
          );
        }));
  }

  getDevicesView(AdminMyUsersState state, context) {
    if (state is AdminMyUsersInitial) {
      return ListView(
        children: List<Widget>.generate(state.users.length,
            (index) => getDeviceItem(state.users[index], index, context)),
      );
    }
    return const Center(child: Text("شما هنوز هیچ کاربری ندارید"));
  }

  Widget getDeviceItem(User trainee, int index, context) {
    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: AppColors.white,
        ),
        margin: const EdgeInsets.all(10),
        height: 80,
        child: Center(
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            onTap: () {
              BlocProvider.of<AdminMyUsersCubit>(context).goToDetailUser(index);
            },
            child: ListTile(
              leading: const InkWell(
                child: Icon(Icons.more_vert),
              ),
              title: Text(
                "${trainee.firstName}  ${trainee.lastName}",
                textAlign: TextAlign.right,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    trainee.phoneNumber,
                    textAlign: TextAlign.right,
                  ),
                  const Icon(
                    Icons.phone_android_rounded,
                    size: 15,
                    color: AppColors.orange,
                  )
                ],
              ),
              trailing: Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: AppColors.lightShadow,
                  ),
                  child: const Icon(
                    Icons.person,
                    color: AppColors.green,
                  )),
            ),
          ),
        ));
  }

  getBody(AdminMyUsersState state, BuildContext context) {
    if (state is AdminMyUsersSelectUser) {
      return AdminUserDetail(user: state.users[state.selectedUser]);
    }
    return getDevicesView(state, context);
  }
}
