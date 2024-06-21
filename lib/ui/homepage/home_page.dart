import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharif_health_app/model/homepage/homepage_cubit.dart';
import 'package:sharif_health_app/ui/homepage/my_tests/my_tests_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Colors.blue;
    const selectedColor = Colors.white;
    const unselectedColor = Colors.red;

    return Scaffold(
      body: getBody(),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: unselectedColor,
        selectedItemColor: selectedColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: backgroundColor,
            icon: ImageIcon(AssetImage("assets/navigation/profile.png")),
            label: 'پروفایل',
          ),
          BottomNavigationBarItem(
            backgroundColor: backgroundColor,
            icon: ImageIcon(AssetImage("assets/navigation/diet.png")),
            label: 'برنامه غذایی',
          ),
          BottomNavigationBarItem(
            backgroundColor: backgroundColor,
            icon: ImageIcon(AssetImage("assets/navigation/test.png")),
            label: 'تست های من',
          ),
          BottomNavigationBarItem(
            backgroundColor: backgroundColor,
            icon: ImageIcon(AssetImage("assets/navigation/home.png")),
            label: 'خانه',
          )
        ],
        currentIndex: index,
        onTap: (index) {
          BlocProvider.of<HomepageCubit>(context).changePage(index);
        },
      ),
    );
  }

  getBody() {
    switch (index) {
      case 0:
        break;
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
