import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharif_health_app/model/homepage/my_tests/my_tests_cubit.dart';
import 'package:sharif_health_app/utils/app_colors.dart';

class MuscleAnalysis extends StatelessWidget {
  const MuscleAnalysis({super.key, required this.data});
  final DeviceData data;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> typeCardList = [
      {
        'name': 'وزن کل عضلات',
        'unit': 'کیلوگرم',
        'icon': 'icon_muscle_mass.png',
        'image': 'image_muscle_mass.png',
        'value': data.muscle_mass,
        'percentage': '',
        'id': 'muscle_mass'
      },
      {
        'name': 'وزن عضلات اسکلتی',
        'unit': 'کیلوگرم',
        'icon': 'icon_muscle_smm.png',
        'image': 'image_muscle_smm.png',
        'value': data.smm,
        'percentage': '',
        'id': 'smm'
      },
      {
        'name': 'وزن استخوان ها',
        'unit': 'کیلوگرم',
        'icon': 'icon_muscle_bone_mass.png',
        'image': 'image_muscle_bone_mass.png',
        'value': data.bone_mass,
        'percentage': '',
        'id': 'bone_mass'
      },
      {
        'name': 'عضلات نیم تنه بالایی',
        'unit': 'کیلوگرم',
        'icon': 'icon_muscle_trunk_mass.png',
        'image': 'image_muscle_trunk_mass.png',
        'value': data.muscle_trunk_m,
        'percentage': '',
        'id': 'muscle_trunk_m'
      },
    ];

    List<Map<String, dynamic>> typeContainerList = [
      {
        'name': 'عضلات دست چپ',
        'unit': 'کیلوگرم',
        'image': 'image_muscle_left_arm.png',
        'value': data.muscle_left_arm_m,
        'percentage': '',
        'id': 'muscle_left_arm_m'
      },
      {
        'name': 'عضلات دست راست',
        'unit': 'کیلوگرم',
        'image': 'image_muscle_right_arm.png',
        'value': data.muscle_right_arm_m,
        'percentage': '',
        'id': 'muscle_right_arm_m'
      },
      {
        'name': 'عضلات پا چپ',
        'unit': 'کیلوگرم',
        'image': 'image_muscle_left_leg.png',
        'value': data.muscle_left_leg_m,
        'percentage': '',
        'id': 'muscle_left_leg_m'
      },
      {
        'name': 'عضلات پا راست',
        'unit': 'کیلوگرم',
        'image': 'image_muscle_right_leg.png',
        'value': data.muscle_right_leg_m,
        'percentage': '',
        'id': 'muscle_right_leg_m'
      },
    ];

    final width = (MediaQuery.of(context).size.width - 30) / 2;
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
        padding: EdgeInsets.all(20),
        itemCount: typeCardItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: typeCardItems[index],
          );
        },
      ),
    );

    finalListContainer = SizedBox(
      child: GridView.count(
          padding: EdgeInsets.all(20),
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: ListTile(
                leading: Stack(children: [
                  Container(
                    width: 100,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 92, 238, 8),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            color: AppColors.shadow,
                            spreadRadius: 2)
                      ],
                    ),
                    child: Text(
                      "${item['value']} ${item['unit']}",
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ]),
                title: Text(
                  item['name'],
                  textAlign: TextAlign.right,
                ),
                trailing: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5,
                          color: AppColors.shadow,
                          spreadRadius: 3)
                    ],
                  ),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            color: AppColors.shadow,
                            spreadRadius: 2)
                      ],
                    ),
                    child: Padding(
                        padding: EdgeInsets.all(5),
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
      padding: EdgeInsets.only(top: 30),
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/mytests/${item['image']}"),
        ),
      ),
      child: InkWell(
        child: ListTile(
          subtitle: Text(
            "${item['value']} ${item['unit']}",
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: 16),
          ),
          title: Text(
            item['name'],
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: 18),
          ),
          // trailing: Container(
          //   width: 60,
          //   height: 60,
          //   margin: const EdgeInsets.only(right: 10),
          //   decoration: const BoxDecoration(
          //     borderRadius: BorderRadius.all(Radius.circular(10)),
          //     color: Color.fromRGBO(250, 250, 250, .3),
          //     shape: BoxShape.rectangle,
          //   ),
          //   child: Image.asset("assets/mytests/${item['icon']}"),
          // ),
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
