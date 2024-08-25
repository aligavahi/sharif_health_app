import 'package:flutter/material.dart';
import 'package:sharif_health_app/model/homepage/my_tests/my_tests_cubit.dart';

class FatAnalysis extends StatelessWidget {
  const FatAnalysis({super.key, required this.data});

  final DeviceData data;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> fatAnalysis = [
      {
        'name': 'وزن بدون احتساب چربی',
        'unit': 'کیلوگرم',
        'icon': 'icon_fat_weight.png',
        'value': data.ffm,
        'percentage': ''
      },
      {
        'name': 'کل چربی بدن',
        'unit': 'کیلوگرم',
        'icon': 'icon_fat_body.png',
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
        'value': data.fat_right_leg_m,
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
    return const Placeholder();
  }
}
