import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharif_health_app/model/homepage/my_tests/my_tests_cubit.dart';
import 'package:sharif_health_app/utils/app_colors.dart';

class FatAnalysis extends StatelessWidget {
  const FatAnalysis({super.key, required this.data});

  final DeviceData data;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> typeCardList = [
      {
        'name': 'وزن بدون احتساب چربی',
        'unit': 'کیلوگرم',
        'icon': 'icon_ffm.png',
        'value': data.ffm,
        'percentage': ''
      },
      {
        'name': 'کل چربی بدن',
        'unit': 'کیلوگرم',
        'icon': 'icon_fat_mass.png',
        'value': data.fat_mass,
        'percentage': ''
      },
      {
        'name': 'شاخص چربی احشایی',
        'unit': '',
        'icon': 'icon_fat_visceral.png',
        'value': data.visceral_fat_rating,
        'percentage': ''
      },
      {
        'name': 'چربی نیم تنه بالایی',
        'unit': 'کیلوگرم',
        'icon': 'icon_fat_top.png',
        'value': data.fat_trunk_m,
        'percentage': data.fat_trunk_p
      },
    ];
    List<Map<String, dynamic>> typeContainerList = [
      {
        'name': 'چربی دست راست',
        'unit': 'کیلوگرم',
        'image': 'image_muscle_right_arm.png',
        'value': data.fat_right_arm_m,
        'percentage': data.fat_right_arm_p
      },
      {
        'name': 'چربی دست چپ',
        'unit': 'کیلوگرم',
        'image': 'image_muscle_left_arm.png',
        'value': data.fat_left_arm_m,
        'percentage': data.fat_left_arm_p
      },
      {
        'name': 'چربی پا راست',
        'unit': 'کیلوگرم',
        'image': 'image_muscle_right_leg.png',
        'value': data.fat_right_leg_m,
        'percentage': data.fat_right_leg_p
      },
      {
        'name': 'چربی پا چپ',
        'unit': 'کیلوگرم',
        'image': 'image_muscle_left_leg.png',
        'value': data.fat_left_leg_m,
        'percentage': data.fat_left_leg_p
      }
    ];
    final width = 250; // (MediaQuery.of(context).size.width - 30) / 2;
    Widget finalListCard;
    Widget finalListContainer;
    List<Widget> typeCardItems = List<Widget>.generate(
        typeCardList.length, (index) => typeCard(context, typeCardList[index]));
    print(typeCardItems);
    List<Widget> typeContainerItems = List<Widget>.generate(
        typeContainerList.length,
        (index) => typeContainer(context, typeContainerList[index]));
    finalListCard = SizedBox(
      height: (width + 5) * .33 * 4 + 50,
      child: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: typeCardItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: typeCardItems[index],
          );
        },
      ),
    );

    finalListContainer = SizedBox(
      child: GridView.count(
          padding: const EdgeInsets.all(20),
          childAspectRatio: 1,
          controller: ScrollController(keepScrollOffset: false),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          children: typeContainerItems),
    );

    return ListView(
      children: [
        finalListCard,
        finalListContainer,
      ],
    );
  }

  typeCard(context, Map<String, dynamic> item) {
    return InkWell(
        onTap: () =>
            BlocProvider.of<MyTestsCubit>(context).goHistory(item['id']),
        child: Card(
          color: AppColors.white,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "assets/mytests/cardtype_background.png",
                  ),
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.centerLeft),
            ),
            child: Center(
              child: ListTile(
                minTileHeight: 70,
                minLeadingWidth: 100,
                minVerticalPadding: 8,
                leading: Container(
                  width: 50,
                  height: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "${item['value']}",
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white),
                      ),
                      if (item['unit'] != '')
                        Text(
                          "${item['unit']}",
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: AppColors.white),
                        ),
                    ],
                  ),
                ),
                title: Text(item['name'],
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.shadow)),
                trailing: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5,
                          color: Color.fromARGB(255, 250, 247, 247),
                          spreadRadius: 3)
                    ],
                  ),
                  child: Container(
                    width: 60,
                    height: 80,
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        const BoxShadow(
                            blurRadius: 10,
                            color: Color.fromRGBO(255, 255, 255, 1),
                            spreadRadius: 2)
                      ],
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Image.asset("assets/mytests/${item['icon']}")),
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  Widget typeContainer(BuildContext context, Map<String, dynamic> item) {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/mytests/${item['image']}"),
        ),
      ),
      child: InkWell(
        child: ListTile(
          contentPadding:
              const EdgeInsets.only(right: 16, left: 16, bottom: 16),
          title: Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Text(
                  item['name'],
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${item['unit']}",
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: AppColors.white),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "${item['value']}",
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("${check_null(item)}",
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white)),
              ],
            ),
          ),
        ),
        onTap: () =>
            BlocProvider.of<MyTestsCubit>(context).goHistory(item['id']),
      ),
    );
  }

  String check_null(Map<String, dynamic> item) {
    return item['percentage'] == '' ? "" : "${item['percentage']} %";
  }
}
