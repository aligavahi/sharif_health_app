import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharif_health_app/model/homepage/homepage_cubit.dart';
import 'package:sharif_health_app/ui/homepage/my_tests/my_tests_page.dart';
import 'package:sharif_health_app/ui/homepage/navigation/navigation_item.dart';
import 'package:sharif_health_app/ui/homepage/profile/main_page/profile_page.dart';
import 'package:sharif_health_app/utils/app_colors.dart';

class TrainerHomePage extends StatelessWidget {
  const TrainerHomePage({super.key, required this.index});

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
            assetName:"assets/trainer/profile.png",
            label: 'پروفایل',
            isActive: index == 0,
          ),
          NavigationItem(
            assetName:"assets/trainer/my_trainee.png",
            label: 'شاگردان من',
            isActive: index == 1,
          ),
          NavigationItem(
            assetName:"assets/trainer/gym_trainee.png",
            label: 'شاگردان باشگاه',
            isActive: index == 2,
          ),
          NavigationItem(
            assetName: "assets/trainer/gyms.png",
            label: 'باشگاه ها',
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
        return const MyTestsPage();
      case 3:
        break;
    }
    return const Center(
      child: Text("coming soon"),
    );
  }
}
