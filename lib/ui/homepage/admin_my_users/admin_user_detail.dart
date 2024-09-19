import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharif_health_app/model/homepage/admin_my_users/admin_my_users_cubit.dart';

class AdminUserDetail extends StatelessWidget {
  final User user;

  const AdminUserDetail({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(user.firstName),
        Text(user.lastName),
        Text(user.phoneNumber),
        Text(user.approvedTestCount.toString()),
        Text(user.testCount.toString()),
        ElevatedButton(
            onPressed: () {
              BlocProvider.of<AdminMyUsersCubit>(context)
                  .goToPermissionDialog();
            },
            child: Text("ویرایش مجوز"))
      ],
    );
  }
}
