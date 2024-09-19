import 'package:flutter/material.dart';
import 'package:sharif_health_app/model/homepage/admin_my_users/admin_my_users_cubit.dart';

class AdminUserPermission extends StatelessWidget {
  final int testCount;
  final int expireDay;
  final AdminMyUsersCubit cubit;

  const AdminUserPermission(
      {super.key, required this.testCount, required this.expireDay, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: const Text("ویرایش مجوز"),
        content: SizedBox(
          width: 100,
          height: 200,
          child: ListView(children: [
            TextField(
              controller: TextEditingController(text: testCount.toString()),
              onChanged: (val) => cubit.editPermissionDialog(testCount: int.parse(val)),
            ),
            TextField(
                controller: TextEditingController(text: expireDay.toString()),
                onChanged: (val) => cubit.editPermissionDialog(day: int.parse(val))),
          ]),
        ),
        actions: [
          ElevatedButton(
              onPressed: () {
                cubit.submitPermission();
              },
              child: Text("ارسال"))
        ]);
  }
}
