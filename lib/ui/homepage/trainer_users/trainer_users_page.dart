import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharif_health_app/model/homepage/trainer_users/trainer_users_cubit.dart';
import 'package:sharif_health_app/utils/app_colors.dart';

class TrainerUsersPage extends StatelessWidget {
  const TrainerUsersPage({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider<TrainerUsersCubit>(
        create: (BuildContext context) => TrainerUsersCubit(),
        child: BlocConsumer<TrainerUsersCubit, TrainerUsersState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Scaffold(
                backgroundColor: AppColors.background,
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  title: const Center(
                    child: Text("کاربران من"),
                  ),
                ),
                body: getDevicesView(state, context),
              );
            }));
  }

  getDevicesView( state, context) {
    if (state is TrainerUsersInitial) {
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
                "${trainee.firstName}  ${trainee.lastName}",
                textAlign: TextAlign.right,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    trainee.mobileNumber,
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
}
