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
                  title: Center(
                    child: Text("دستگاه های من"),
                  ),
                ),
                body: getDevicesView(state),
              );
            }));
  }

  getDevicesView(MyDevicesState state) {
    if (state is MyDevicesInitial) {
      return ListView(
        children: List<Widget>.generate(state.devices.length,
            (index) => getDeviceItem(state.devices[index], state.selected)),
      );
    }
    return const Center(
        child:
            Text("شما هنوز هیچ دستگاهی ندارید. لطفا با پشنیبانی تماس بگیرید"));
  }

  Widget getDeviceItem(DeviceCenterData device, int selected) {
    return SizedBox(
      height: 100,
      child: ListTile(
        tileColor: AppColors.white,
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
            const Icon(Icons.lightbulb_circle_rounded,size: 15,color: AppColors.orange,)
          ],
        ),
        trailing: const Icon(Icons.bike_scooter),
      ),
    );
  }
}
