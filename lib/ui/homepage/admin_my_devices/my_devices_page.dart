import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharif_health_app/model/homepage/my_devices/my_devices_cubit.dart';
import 'package:sharif_health_app/utils/app_colors.dart';

class MyDevicesPage extends StatelessWidget {
  const MyDevicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MyDevicesCubit>(
        create: (BuildContext context) => MyDevicesCubit(),
        child: BlocConsumer<MyDevicesCubit, MyDevicesState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Scaffold(
                backgroundColor: AppColors.background,
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  title: const Center(
                    child: Text("دستگاه های من"),
                  ),
                ),
                body: getDevicesView(state, context),
              );
            }));
  }

  getDevicesView(MyDevicesState state, context) {
    if (state is MyDevicesInitial) {
      return ListView(
        children: List<Widget>.generate(
            state.devices.length,
            (index) => getDeviceItem(
                state.devices[index], index, index == state.selected, context)),
      );
    }
    return const Center(
        child:
            Text("شما هنوز هیچ دستگاهی ندارید. لطفا با پشنیبانی تماس بگیرید"));
  }

  Widget getDeviceItem(
      DeviceCenterData device, int index, bool selected, context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: selected ? AppColors.green : AppColors.white,
        ),
        margin: const EdgeInsets.all(10),
        height: 80,
        child: Center(
          child: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            onTap: () {
              BlocProvider.of<MyDevicesCubit>(context).selectDevice(index);
            },
            child: ListTile(
              leading: const InkWell(
                child: Icon(Icons.more_vert),
              ),
              title: Text(
                device.name,
                textAlign: TextAlign.right,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    device.deviceId,
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
                    color: selected ? AppColors.white : AppColors.green,
                  )),
            ),
          ),
        ));
  }
}
