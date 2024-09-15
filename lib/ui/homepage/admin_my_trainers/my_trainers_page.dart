import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharif_health_app/model/homepage/my_trainers/my_trainers_cubit.dart';
import 'package:sharif_health_app/utils/app_colors.dart';

class MyTrainersPage extends StatelessWidget {
  const MyTrainersPage({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider<MyTrainersCubit>(
        create: (BuildContext context) => MyTrainersCubit(),
        child: BlocConsumer<MyTrainersCubit, MyTrainersState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Scaffold(
                backgroundColor: AppColors.background,
                appBar: AppBar(
                  title: const Center(
                    child: Text("مربیان من"),
                  ),
                ),
                body: getDevicesView(state, context),
              );
            }));
  }

  getDevicesView(MyTrainersState state, context) {
    if (state is MyTrainersInitial) {
      return ListView(
        children: List<Widget>.generate(
            state.trainers.length,
                (index) => getDeviceItem(
                state.trainers[index], index, context)),
      );
    }
    return const Center(
        child:
        Text("شما هنوز هیچ مربی اضافه نکرده اید."));
  }

  Widget getDeviceItem(
      Trainer trainer, int index, context) {
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
                trainer.firstName,
                textAlign: TextAlign.right,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    trainer.lastName,
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
