import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharif_health_app/model/homepage/homepage_cubit.dart';
import 'package:sharif_health_app/ui/homepage/admin_my_devices/my_devices_page.dart';
import 'package:sharif_health_app/ui/homepage/my_tests/my_tests_page.dart';
import 'package:sharif_health_app/ui/homepage/navigation/navigation_item.dart';
import 'package:sharif_health_app/ui/homepage/profile/main_page/profile_page.dart';
import 'package:sharif_health_app/utils/app_colors.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: AppColors.background,
        color: AppColors.white,
        buttonBackgroundColor: AppColors.green,
        items: [
          NavigationItem(
            assetName: "assets/admin/profile.png",
            label: 'پروفایل',
            isActive: index == 0,
          ),
          NavigationItem(
            assetName: "assets/admin/my_users.png",
            label: 'کاربران من',
            isActive: index == 1,
          ),
          NavigationItem(
            assetName: "assets/admin/my_devices.png",
            label: 'دستگاه های من',
            isActive: index == 2,
          ),
          NavigationItem(
            assetName: "assets/admin/my_trainers.png",
            label: 'مربیان من',
            isActive: index == 3,
          )
        ],
        index: index,
        onTap: (index) {
          BlocProvider.of<HomepageCubit>(context).changePage(index);
        },
      ),
    );
  }

  getBody() {
    switch (index) {
      case 0:
        return const ProfilePage();
      case 1:
        break;
      case 2:
        return const MyDevicesPage();
      case 3:
        return;
    }
    return const Center(
      child: Text("coming soon"),
    );
  }
}
