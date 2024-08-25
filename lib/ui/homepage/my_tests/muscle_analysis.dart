import 'package:flutter/cupertino.dart';
import 'package:sharif_health_app/model/homepage/my_tests/my_tests_cubit.dart';

class MuscleAnalysis extends StatelessWidget {
  const MuscleAnalysis({super.key, required this.data});
  final DeviceData data;

  @override
  Widget build(BuildContext context) {
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
        'value': data.smm,
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
    return const Placeholder();
  }
}
