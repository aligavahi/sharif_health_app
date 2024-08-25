import 'package:flutter/material.dart';
import 'package:sharif_health_app/utils/app_colors.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CircleAvatar(
        backgroundImage: const AssetImage('assets/profile/profile_avatar.png'),
        radius: MediaQuery.of(context).size.height * .25 * .5,
        backgroundColor: Colors.white,
      ),
      Positioned(
        bottom: 0,
        right: 0,
        child: ElevatedButton(
            style: ButtonStyle(
                shape: WidgetStateProperty.all(CircleBorder()),
                padding: WidgetStateProperty.all(EdgeInsets.all(20)),
                backgroundColor: WidgetStateProperty.all(AppColors.green)),
            onPressed: () {},
            child: const Icon(
              Icons.edit,
              color: Colors.white,
            )),
      )
    ]);
  }
}
