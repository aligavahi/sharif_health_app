part of 'my_tests_cubit.dart';

class DeviceData{
  final String device_model;
  final String load_dt ;
  final String date ;
  final String time ;
  final String gender ;
  final int    age;
  final double height ;
  final int    active_level ;
  final double weight ;
  final double bmi ;
  final double fat_percentage_p ;
  final double fat_right_arm_p ;
  final double fat_left_arm_p ;
  final double fat_right_leg_p ;
  final double fat_Left_leg_p ;
  final double fat_trunk_p ;
  final double muscle_mass ;
  final double muscle_right_arm_m ;
  final double muscle_left_arm_m ;
  final double muscle_right_leg_m ;
  final double muscle_left_leg_m ;
  final double muscle_trunk_m ;
  final double bone_mass ;
  final int    visceral_fat_rating ;
  final double bmr ;
  final int    metabolic_age ;
  final double total_water_percentage ;
  final double total_Water_weight ;
  final double fat_mass ;
  final double ffm ;
  final double fat_right_leg_m ;
  final double fat_left_leg_m ;
  final double fat_right_arm_m ;
  final double fat_left_arm_m ;
  final double fat_trunk_m ;
  final double smm ;
  final int    lower_weight ;
  final int    upper_weight ;
  final double lower_bmi ;
  final double upper_bmi ;
  final int    lower_fat_p ;
  final int    upper_fat_p ;
  final double lower_fat_m ;
  final double upper_fat_m ;
  final double lower_ffm ;
  final double upper_ffm ;
  final String fat_physique_rating ;
  final double lower_muscle_m ;
  final double upper_muscle_m ;
  final String muscle_physique_rating ;
  final String physique_rating ;

  DeviceData({required this.device_model, required this.load_dt, required this.date, required this.time, required this.gender, required this.age, required this.height, required this.active_level, required this.weight, required this.bmi, required this.fat_percentage_p, required this.fat_right_arm_p, required this.fat_left_arm_p, required this.fat_right_leg_p, required this.fat_Left_leg_p, required this.fat_trunk_p, required this.muscle_mass, required this.muscle_right_arm_m, required this.muscle_left_arm_m, required this.muscle_right_leg_m, required this.muscle_left_leg_m, required this.muscle_trunk_m, required this.bone_mass, required this.visceral_fat_rating, required this.bmr, required this.metabolic_age, required this.total_water_percentage, required this.total_Water_weight, required this.fat_mass, required this.ffm, required this.fat_right_leg_m, required this.fat_left_leg_m, required this.fat_right_arm_m, required this.fat_left_arm_m, required this.fat_trunk_m, required this.smm, required this.lower_weight, required this.upper_weight, required this.lower_bmi, required this.upper_bmi, required this.lower_fat_p, required this.upper_fat_p, required this.lower_fat_m, required this.upper_fat_m, required this.lower_ffm, required this.upper_ffm, required this.fat_physique_rating, required this.lower_muscle_m, required this.upper_muscle_m, required this.muscle_physique_rating, required this.physique_rating});

  static Map<Symbol, dynamic> symbolizeKeys(Map map){
    return map.map((k, v) => MapEntry(Symbol(k), v));
  }
  static List<DeviceData> fromListOfDict(List<Map> data) {

    print(data);
    return List<DeviceData>.generate(
        data.length,(index) =>Function.apply(DeviceData.new, [],symbolizeKeys(data[index]))
    );
  }

}



@immutable
sealed class MyTestsState {
  final List<DeviceData> tests;

  const MyTestsState({required this.tests});
}

final class MyTestsInitial extends MyTestsState {
  const MyTestsInitial({required super.tests});
}


final class MyTestsDataReady extends MyTestsState {
  const MyTestsDataReady({required super.tests});
}
