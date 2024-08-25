import 'package:flutter/material.dart';
import 'package:sharif_health_app/model/homepage/my_tests/my_tests_cubit.dart';
import 'package:sharif_health_app/utils/gradient_text.dart';

class GeneralAnalysis extends StatelessWidget {
  GeneralAnalysis({super.key, required this.data});

  final DeviceData data;
  final gradientMainColor = () =>
      LinearGradient(colors: [Colors.green.shade800, Colors.blue.shade800]);

  @override
  Widget build(BuildContext context) {
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
        'value': data.bmi,
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
    final width = (MediaQuery.of(context).size.width - 30) / 2;
    List<Widget> final_list = [];
    List<Widget> typ1_items = List<Widget>.generate(typ1Analysis.length,
            (index) => get_general_typ1_item(context, typ1Analysis[index]));
    List<Widget> typ2_items = List<Widget>.generate(typ2Analysis.length,
            (index) => get_general_typ2_item(context, typ2Analysis[index]));
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
    return const Placeholder();
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
  String check_null(Map<String, dynamic> item) {
    return item['percentage'] == '' ? "" : "${item['percentage']} %";
  }
}
