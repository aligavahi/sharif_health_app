import 'package:flutter/material.dart';
import 'package:sharif_health_app/model/homepage/admin_my_users/admin_my_users_cubit.dart';

class AdminUserPermission extends StatelessWidget {
  final AdminMyUsersCubit cubit;

  const AdminUserPermission({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        actionsAlignment: MainAxisAlignment.spaceAround,
        title: const Text("ویرایش مجوز"),
        content: SizedBox(
          width: 100,
          height: 200,
          child: ListView(children: [
            TextField(
              autofocus: true,
              decoration: const InputDecoration(
                  labelText: "افزایش تعداد استفاده مجوز",
                  labelStyle: TextStyle(fontSize: 11),
                  floatingLabelAlignment: FloatingLabelAlignment.center),
              onChanged: (val) =>
                  cubit.editPermissionDialog(testCount: int.parse(val)),
            ),
            const SizedBox(height: 10),
            TextField(
                autofocus: true,
                decoration: const InputDecoration(
                    labelText: "تعداد روز اعتبار مجوز",
                    labelStyle: TextStyle(fontSize: 11),
                    floatingLabelAlignment: FloatingLabelAlignment.center),
                onChanged: (val) =>
                    cubit.editPermissionDialog(day: int.parse(val))),
            const SizedBox(height: 15),
            ElevatedButton(
                onPressed: () {
                  cubit.submitPermission();
                },
                child: const Text("تایید"))
          ]),
        ));
  }
}
