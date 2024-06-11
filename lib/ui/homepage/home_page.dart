import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final int index = 0;

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Colors.blue;
    const selectedColor = Colors.white;
    const unselectedColor = Colors.red;

    return Scaffold(
      body: Center(
        child: Text("coming soon"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: unselectedColor,
        selectedItemColor: selectedColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: backgroundColor,
            icon: const ImageIcon(AssetImage("assets/navigation/profile.png")),
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
        onTap: (index) {},
      ),
    );
  }
}
