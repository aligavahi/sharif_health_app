import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharif_health_app/model/homepage/my_tests/my_tests_cubit.dart';
import 'package:sharif_health_app/utils/gradient_text.dart';

class TestSummarySection extends StatelessWidget {
  TestSummarySection({super.key, required this.data});

  final gradientMainColor = () =>
      LinearGradient(colors: [Colors.green.shade800, Colors.blue.shade800]);

  final DeviceData data;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> fatAnalysis = [
      {
        'name': 'وزن بدون احتساب چربی',
        'unit': 'کیلوگرم',
        'icon': 'icon_fat_weight.png',
        'value': data.fat_mass,
        'percentage': ''
      },
      {
        'name': 'کل چربی بدن',
        'unit': 'کیلوگرم',
        'icon': 'icon_fat_body.png',
        'value': data.fat_trunk_m,
        'percentage': data.fat_trunk_p
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
        'value': data.upper_fat_m,
        'percentage': ''
      },
      {
        'name': 'چربی دست راست',
        'unit': 'کیلوگرم',
        'icon': 'icon_fat_right_hand.png',
        'value': data.fat_right_arm_m,
        'percentage': data.fat_right_arm_p
      },
      {
        'name': 'چربی دست چپ',
        'unit': 'کیلوگرم',
        'icon': 'icon_fat_left_hand.png',
        'value': data.fat_left_arm_m,
        'percentage': data.fat_left_arm_p
      },
      {
        'name': 'چربی پا راست',
        'unit': 'کیلوگرم',
        'icon': 'icon_fat_right_foot.png',
        'value': data.fat_right_arm_m,
        'percentage': data.fat_right_leg_p
      },
      {
        'name': 'چربی پا چپ',
        'unit': 'کیلوگرم',
        'icon': 'icon_fat_left_foot.png',
        'value': data.fat_left_leg_m,
        'percentage': data.fat_left_leg_p
      }
    ];

    List<Map<String, dynamic>> muscleAnalysis = [
      {
        'name': 'وزن کل عضلات',
        'unit': 'کیلوگرم',
        'icon': 'icon_fat_weight.png',
        'value': data.muscle_mass,
        'percentage': ''
      },
      {
        'name': 'وزن عضلات اسکلتی',
        'unit': 'کیلوگرم',
        'icon': 'icon_fat_body.png',
        'value': data.muscle_trunk_m,
        'percentage': ''
      },
      {
        'name': 'وزن استخوان ها',
        'unit': 'کیلوگرم',
        'icon': 'icon_fat_visceral.png',
        'value': data.bone_mass,
        'percentage': ''
      },
      {
        'name': 'عضلات نیم تنه بالایی',
        'unit': 'کیلوگرم',
        'icon': 'icon_fat_top.png',
        'value': data.muscle_trunk_m,
        'percentage': ''
      },
      {
        'name': 'عضلات دست راست',
        'unit': 'کیلوگرم',
        'icon': 'icon_fat_right_hand.png',
        'value': data.muscle_right_arm_m,
        'percentage': ''
      },
      {
        'name': 'عضلات دست چپ',
        'unit': 'کیلوگرم',
        'icon': 'icon_fat_left_hand.png',
        'value': data.muscle_left_arm_m,
        'percentage': ''
      },
      {
        'name': 'عضلات پا راست',
        'unit': 'کیلوگرم',
        'icon': 'icon_fat_right_foot.png',
        'value': data.muscle_right_leg_m,
        'percentage': ''
      },
      {
        'name': 'عضلات پا چپ',
        'unit': 'کیلوگرم',
        'icon': 'icon_fat_left_foot.png',
        'value': data.muscle_left_leg_m,
        'percentage': ''
      }
    ];

    List<Map<String, dynamic>> typ1Analysis = [
      {
        'name': 'قد',
        'unit': 'سانتی متر',
        'icon': 'general1_icon1.png',
        'value': data.height,
        'percentage': ''
      },
      {
        'name': 'وزن',
        'unit': 'کیلوگرم',
        'icon': 'general1_icon2.png',
        'value': data.weight,
        'percentage': ''
      },
    ];

    List<Map<String, dynamic>> typ2Analysis = [
      {
        'name': 'سن متابولیک',
        'unit': 'سال',
        'icon': 'general2_icon1.png',
        'image': 'general2_image1.png',
        'value': data.metabolic_age,
        'percentage': ''
      },
      {
        'name': 'شاخص توده بدنی',
        'unit': '',
        'icon': 'general2_icon2.png',
        'image': 'general2_image2.png',
        'value': data.ffm,
        'percentage': ''
      },
      {
        'name': 'متابولیسم پایه',
        'unit': 'کیلوکالری',
        'icon': 'general2_icon3.png',
        'image': 'general2_image3.png',
        'value': data.bmr,
        'percentage': ''
      },
      {
        'name': 'میزان آب بدن',
        'unit': 'لیتر',
        'icon': 'general2_icon4.png',
        'image': 'general2_image4.png',
        'value': data.total_water_weight,
        'percentage': data.total_water_percentage
      },
    ];

    List<Widget> general_header = [
      Container(
        margin: const EdgeInsets.all(15.0),
        child: Center(
            child: Text(
          "آنالیز کلی",
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
      )
    ];
    List<Widget> typ1_items = List<Widget>.generate(typ1Analysis.length,
        (index) => get_general_typ1_item(context, typ1Analysis[index]));
    List<Widget> typ2_items = List<Widget>.generate(typ2Analysis.length,
        (index) => get_general_typ2_item(context, typ2Analysis[index]));

    List<Widget> fat_header = [
      Container(
          margin: const EdgeInsets.all(15.0),
          child: Center(
              child: Text("آنالیز چربی",
                  style: TextStyle(fontWeight: FontWeight.bold))))
    ];
    List<Widget> fat_list = List<Card>.generate(fatAnalysis.length,
        (index) => get_card_item(context, fatAnalysis[index]));

    List<Widget> muscle_header = [
      Container(
          margin: const EdgeInsets.all(15.0),
          child: Center(
              child: Text("آنالیز عضلات",
                  style: TextStyle(fontWeight: FontWeight.bold))))
    ];
    List<Widget> muscle_list = List<Card>.generate(fatAnalysis.length,
        (index) => get_card_item(context, muscleAnalysis[index]));

    List<Widget> final_list = [];
    final width = (MediaQuery.of(context).size.width - 30) / 2;
    final_list.addAll(general_header);
    final_list.add(SizedBox(
      height: (width + 5) * .5 * 1,
      child: GridView.count(
        childAspectRatio: 2,
        controller: new ScrollController(keepScrollOffset: false),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        crossAxisCount: 2,
        children: typ1_items,
      ),
    ));
    final_list.add(SizedBox(
      height: (width + 2) * 1 * 2,
      child: GridView.count(
        childAspectRatio: 1,
        controller: new ScrollController(keepScrollOffset: false),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        crossAxisCount: 2,
        children: typ2_items,
      ),
    ));
    final_list.addAll(fat_header);
    final_list.addAll(fat_list);
    final_list.addAll(muscle_header);
    final_list.addAll(muscle_list);

    return Scaffold(
        backgroundColor: Colors.white60,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              BlocProvider.of<MyTestsCubit>(context).goBack();
            },
          ),
          title: Center(
              child: Row(children: [
            Spacer(),
            Text(data.getHijriFormatDate()),
            Spacer(
              flex: 2,
            ),
            Text(data.center),
            Spacer(),
          ])),
        ),
        body: ListView(padding: EdgeInsets.all(30), children: final_list));
  }

  get_general_typ1_item(context, Map<String, dynamic> item) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
            gradient: gradientMainColor(),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: ListTile(
          contentPadding: EdgeInsets.all(10),
          subtitle: Text(
            "${item['value']} ${item['unit']}",
            textDirection: TextDirection.rtl,
            style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          title: Text(
            item['name'],
            style: const TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.right,
          ),
          leading: Image.asset("assets/mytests/${item['icon']}"),
          isThreeLine: true,
        ),
      ),
    );
  }

  get_general_typ2_item(context, Map<String, dynamic> item) {
    return Card(
      color: Colors.white,
      shadowColor: Colors.black,
      margin: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          children: [
            ListTile(
              iconColor: Colors.green,
              contentPadding: EdgeInsets.all(10),
              title: GradientText(
                text: Text(
                  item['name'],
                  textAlign: TextAlign.right,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                gradient: gradientMainColor(),
              ),
              trailing: Image.asset("assets/mytests/${item['icon']}"),
            ),
            Expanded(
              child: Center(
                child: ListTile(
                  leading: GradientText(
                    text: Text(
                      "${item['value']} ${item['unit']}",
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    gradient: gradientMainColor(),
                  ),
                  title: Image.asset("assets/mytests/${item['image']}"),
                  trailing: GradientText(
                    text: Text(
                      check_null(item),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    gradient: gradientMainColor(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  get_card_item(context, Map<String, dynamic> item) {
    return Card(
      color: Colors.white,
      shadowColor: Colors.black,
      child: ListTile(
        title: Row(children: [
          Expanded(
              flex: 1,
              child: Text(
                '${item['value']} ${item['unit']}',
                textDirection: TextDirection.rtl,
              )),
          Expanded(
              flex: 1,
              child: Text(check_null(item), textDirection: TextDirection.rtl)),
          Expanded(
              flex: 2,
              child: Text(item['name'], textDirection: TextDirection.rtl)),
        ]),
        trailing: SizedBox(
          child: Image.asset(
            "assets/mytests/${item['icon']}",
          ),
        ),
      ),
    );
  }

  String check_null(Map<String, dynamic> item) {
    return item['percentage'] == '' ? "" : "${item['percentage']} %";
  }
}
