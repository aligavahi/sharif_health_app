import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharif_health_app/model/homepage/my_tests/my_tests_cubit.dart';

class TestSummarySection extends StatelessWidget {
  const TestSummarySection({super.key, required this.data});

  final DeviceData data;

  @override
  Widget build(BuildContext context) {
    final items = Map<String, dynamic>();
    items.addAll({
      'center': data.center,
      'device_model': data.device_model,
      'load_dt': data.load_dt,
      'date': data.date,
      'time': data.time,
      'gender': data.gender,
      'age': data.age,
      'height': data.height,
      'active_level': data.active_level,
      'weight': data.weight,
      'bmi': data.bmi,
      'fat_percentage': data.fat_percentage,
      'fat_right_arm_p': data.fat_right_arm_p,
      'fat_left_arm_p': data.fat_left_arm_p,
      'fat_right_leg_p': data.fat_right_leg_p,
      'fat_left_leg_p': data.fat_left_leg_p,
      'fat_trunk_p': data.fat_trunk_p,
      'muscle_mass': data.muscle_mass,
      'muscle_right_arm_m': data.muscle_right_arm_m,
      'muscle_left_arm_m': data.muscle_left_arm_m,
      'muscle_right_leg_m': data.muscle_right_leg_m,
      'muscle_left_leg_m': data.muscle_left_leg_m,
      'muscle_trunk_m': data.muscle_trunk_m,
      'bone_mass': data.bone_mass,
      'visceral_fat_rating': data.visceral_fat_rating,
      'bmr': data.bmr,
      'metabolic_age': data.metabolic_age,
      'total_water_percentage': data.total_water_percentage,
      'total_water_weight': data.total_water_weight,
      'fat_mass': data.fat_mass,
      'ffm': data.ffm,
      'fat_right_leg_m': data.fat_right_leg_m,
      'fat_left_leg_m': data.fat_left_leg_m,
      'fat_right_arm_m': data.fat_right_arm_m,
      'fat_left_arm_m': data.fat_left_arm_m,
      'fat_trunk_m': data.fat_trunk_m,
      'smm': data.smm,
      'lower_weight': data.lower_weight,
      'upper_weight': data.upper_weight,
      'lower_bmi': data.lower_bmi,
      'upper_bmi': data.upper_bmi,
      'lower_fat_p': data.lower_fat_p,
      'upper_fat_p': data.upper_fat_p,
      'lower_fat_m': data.lower_fat_m,
      'upper_fat_m': data.upper_fat_m,
      'lower_ffm': data.lower_ffm,
      'upper_ffm': data.upper_ffm,
      'fat_physique_rating': data.fat_physique_rating,
      'lower_muscle_m': data.lower_muscle_m,
      'upper_muscle_m': data.upper_muscle_m,
      'muscle_physique_rating': data.muscle_physique_rating,
      'physique_rating': data.physique_rating,
    });
    return Scaffold(
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
      body: GridView.builder(
        itemCount: items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(
                  textAlign: TextAlign.center,
                  items.keys.toList()[index],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              subtitle: Center(child: Text(items.values.toList()[index].toString())),
            ),
          );
        },
      ),
    );
  }
}
