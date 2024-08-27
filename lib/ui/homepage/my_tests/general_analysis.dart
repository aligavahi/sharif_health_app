import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharif_health_app/model/homepage/my_tests/my_tests_cubit.dart';
import 'package:sharif_health_app/utils/app_colors.dart';

class GeneralAnalysis extends StatelessWidget {
  const GeneralAnalysis({super.key, required this.data});

  final DeviceData data;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> typ1Analysis = [
      {
        'name': 'قد شما',
        'unit': 'سانتی متر',
        'icon': 'general_height.png',
        'value': data.height,
        'id': 'height'
      },
      {
        'name': 'وزن شما',
        'unit': 'کیلوگرم',
        'icon': 'general_weight.png',
        'value': data.weight,
        'id': 'weight'
      },
    ];

    List<Map<String, dynamic>> typ2Analysis = [
      {
        'name': 'سن متابولیک',
        'unit': 'سال',
        'icon': 'general_icon1.png',
        'image': 'general_back1.png',
        'value': data.metabolic_age,
        'percentage': '',
        'id': 'metabolic_age'
      },
      {
        'name': 'شاخص توده بدنی',
        'unit': '',
        'icon': 'general_icon2.png',
        'image': 'general_back2.png',
        'value': data.bmi,
        'percentage': '',
        'id': 'bmi'
      },
      {
        'name': 'میزان آب بدن',
        'unit': 'لیتر',
        'icon': 'general_icon3.png',
        'image': 'general_back3.png',
        'value': data.total_water_weight,
        'percentage': data.total_water_percentage,
        'id': 'total_water_weight'
      },
      {
        'name': 'متابولیسم پایه',
        'unit': 'کیلوکالری',
        'icon': 'general_icon4.png',
        'image': 'general_back4.png',
        'value': data.bmr,
        'percentage': '',
        'id': 'bmr'
      },
    ];
    final width = (MediaQuery.of(context).size.width - 30) / 2;
    List<Widget> final_list = [];
    List<Widget> typ1_items = List<Widget>.generate(typ1Analysis.length,
        (index) => get_general_typ1_item(context, typ1Analysis[index]));
    List<Widget> typ2_items = List<Widget>.generate(typ2Analysis.length,
        (index) => get_general_typ2_item(context, typ2Analysis[index]));
    final_list.add(SizedBox(
      height: (width + 5) * .33 * 1 + 20,
      child: GridView.count(
        childAspectRatio: 3,
        controller: new ScrollController(keepScrollOffset: false),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(20),
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        crossAxisCount: 2,
        children: typ1_items,
      ),
    ));
    final_list.add(SizedBox(
      height: (width + 2) * 1 * 2 + 2 * 20,
      child: GridView.count(
        padding: EdgeInsets.all(20),
        childAspectRatio: 1,
        controller: new ScrollController(keepScrollOffset: false),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        children: typ2_items,
      ),
    ));
    return ListView(
      children: final_list,
    );
  }

  get_general_typ1_item(context, Map<String, dynamic> item) {
    return InkWell(
        onTap: () =>
            BlocProvider.of<MyTestsCubit>(context).goHistory(item['id']),
        child: Card(
          color: AppColors.white,
          child: Center(
            child: ListTile(
              subtitle: Text(
                "${item['value']} ${item['unit']}",
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
              ),
              title: Text(
                item['name'],
                textAlign: TextAlign.right,
              ),
              leading: Container(
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 5, color: AppColors.shadow, spreadRadius: 3)
                  ],
                ),
                child: CircleAvatar(
                    backgroundColor: AppColors.background,
                    radius: 30,
                    child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Image.asset("assets/mytests/${item['icon']}"))),
              ),
            ),
          ),
        ));
  }

  Widget get_general_typ2_item(context, Map<String, dynamic> item) {
    return Container(
        padding: EdgeInsets.only(top: 30),
        margin: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  "assets/mytests/${item['image']}",
                ))),
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
              trailing: Container(
                  width: 60,
                  height: 60,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color.fromRGBO(250, 250, 250, .3),
                    shape: BoxShape.rectangle,
                  ),
                  child: Image.asset("assets/mytests/${item['icon']}"))),
          onTap: () =>
              BlocProvider.of<MyTestsCubit>(context).goHistory(item['id']),
        ));
  }

  String check_null(Map<String, dynamic> item) {
    return item['percentage'] == '' ? "" : "${item['percentage']} %";
  }
}
