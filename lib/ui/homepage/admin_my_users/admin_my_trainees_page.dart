import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharif_health_app/model/homepage/admin_my_users/admin_my_users_cubit.dart';
import 'package:sharif_health_app/model/homepage/my_trainers/my_trainers_cubit.dart';
import 'package:sharif_health_app/utils/app_colors.dart';

class AdminMyTraineesPage extends StatelessWidget {
  const AdminMyTraineesPage({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider<AdminMyUsersCubit>(
        create: (BuildContext context) => AdminMyUsersCubit(),
        child: BlocConsumer<AdminMyUsersCubit, AdminMyUsersState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Scaffold(
                backgroundColor: AppColors.background,
                appBar: AppBar(
                  title: const Center(
                    child: Text("کاربران من"),
                  ),
                ),
                body: getDevicesView(state, context),
              );
            }));
  }

  getDevicesView(AdminMyUsersState state, context) {
    if (state is AdminMyUsersInitial) {
      return ListView(
        children: List<Widget>.generate(
            state.users.length,
                (index) => getDeviceItem(
                state.users[index], index, context)),
      );
    }
    return const Center(
        child:
        Text("شما هنوز هیچ کاربری ندارید"));
  }

  Widget getDeviceItem(
      User trainee, int index, context) {
    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: AppColors.white,
        ),
        margin: const EdgeInsets.all(10),
        height: 80,
        child: Center(
          child: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            onTap: () {
            },
            child: ListTile(
              leading: const InkWell(
                child: Icon(Icons.more_vert),
              ),
              title: Text(
                trainee.firstName,
                textAlign: TextAlign.right,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    trainee.lastName,
                    textAlign: TextAlign.right,
                  ),
                  const Icon(
                    Icons.lightbulb_circle_rounded,
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
                  child: Icon(
                    Icons.bike_scooter,
                    color: AppColors.green,
                  )),
            ),
          ),
        ));
  }
}
