part of 'my_tests_cubit.dart';

class DeviceData {
  final String device_model;
  final String load_dt;

  final String date;

  final String time;

  final String gender;

  final int age;
  final double height;

  final int active_level;

  final double weight;

  final double bmi;

  final String center;

  final double fat_percentage;

  final double fat_right_arm_p;

  final double fat_left_arm_p;

  final double fat_right_leg_p;

  final double fat_left_leg_p;

  final double fat_trunk_p;

  final double muscle_mass;

  final double muscle_right_arm_m;

  final double muscle_left_arm_m;

  final double muscle_right_leg_m;

  final double muscle_left_leg_m;

  final double muscle_trunk_m;

  final double bone_mass;

  final int visceral_fat_rating;

  final double bmr;

  final int metabolic_age;

  final double total_water_percentage;

  final double total_water_weight;

  final double fat_mass;

  final double ffm;

  final double fat_right_leg_m;

  final double fat_left_leg_m;

  final double fat_right_arm_m;

  final double fat_left_arm_m;

  final double fat_trunk_m;

  final double smm;

  final int lower_weight;

  final int upper_weight;

  final double lower_bmi;

  final double upper_bmi;

  final int lower_fat_p;

  final int upper_fat_p;

  final double lower_fat_m;

  final double upper_fat_m;

  final double lower_ffm;

  final double upper_ffm;

  final String fat_physique_rating;

  final double lower_muscle_m;

  final double upper_muscle_m;

  final String muscle_physique_rating;

  final String physique_rating;

  String formatDate(Date d) {
    final f = d.formatter;

    return '${f.wN} ${f.d} ${f.mN} ${f.yyyy}';
  }

  String getHijriFormatDate() {
    DateFormat format = new DateFormat("dd/MM/yyyy");

    DateTime dateTime = format.parse(date.replaceAll('"', ''));
    Gregorian gregorian = Gregorian.fromDateTime(dateTime);
    return formatDate(Jalali.fromGregorian(gregorian));
  }

  DeviceData(
      {
      required this.center,
      required this.device_model,
      required this.load_dt,
      required this.date,
      required this.time,
      required this.gender,
      required this.age,
      required this.height,
      required this.active_level,
      required this.weight,
      required this.bmi,
      required this.fat_percentage,
      required this.fat_right_arm_p,
      required this.fat_left_arm_p,
      required this.fat_right_leg_p,
      required this.fat_left_leg_p,
      required this.fat_trunk_p,
      required this.muscle_mass,
      required this.muscle_right_arm_m,
      required this.muscle_left_arm_m,
      required this.muscle_right_leg_m,
      required this.muscle_left_leg_m,
      required this.muscle_trunk_m,
      required this.bone_mass,
      required this.visceral_fat_rating,
      required this.bmr,
      required this.metabolic_age,
      required this.total_water_percentage,
      required this.total_water_weight,
      required this.fat_mass,
      required this.ffm,
      required this.fat_right_leg_m,
      required this.fat_left_leg_m,
      required this.fat_right_arm_m,
      required this.fat_left_arm_m,
      required this.fat_trunk_m,
      required this.smm,
      required this.lower_weight,
      required this.upper_weight,
      required this.lower_bmi,
      required this.upper_bmi,
      required this.lower_fat_p,
      required this.upper_fat_p,
      required this.lower_fat_m,
      required this.upper_fat_m,
      required this.lower_ffm,
      required this.upper_ffm,
      required this.fat_physique_rating,
      required this.lower_muscle_m,
      required this.upper_muscle_m,
      required this.muscle_physique_rating,
      required this.physique_rating});

  static List<DeviceData> fromListOfDict(List<Map> data) {
    return List<DeviceData>.generate(
        data.length,
        (index) => (DeviceData(
            device_model: data[index]['device_model'],
            load_dt: data[index]['load_dt'],
            date: data[index]['date'],
            time: data[index]['time'],
            gender: data[index]['gender'],
            age: data[index]['age'],
            height: data[index]['height'],
            active_level: data[index]['active_level'],
            weight: data[index]['weight'],
            bmi: data[index]['bmi'],
            fat_percentage: data[index]['fat_percentage'],
            fat_right_arm_p: data[index]['fat_right_arm_p'],
            fat_left_arm_p: data[index]['fat_left_arm_p'],
            fat_right_leg_p: data[index]['fat_right_leg_p'],
            fat_left_leg_p: data[index]['fat_left_leg_p'],
            fat_trunk_p: data[index]['fat_trunk_p'],
            muscle_mass: data[index]['muscle_mass'],
            muscle_right_arm_m: data[index]['muscle_right_arm_m'],
            muscle_left_arm_m: data[index]['muscle_left_arm_m'],
            muscle_right_leg_m: data[index]['muscle_right_leg_m'],
            muscle_left_leg_m: data[index]['muscle_left_leg_m'],
            muscle_trunk_m: data[index]['muscle_trunk_m'],
            bone_mass: data[index]['bone_mass'],
            visceral_fat_rating: data[index]['visceral_fat_rating'],
            bmr: data[index]['bmr'],
            metabolic_age: data[index]['metabolic_age'],
            total_water_percentage: data[index]['total_water_percentage'],
            total_water_weight: data[index]['total_water_weight'],
            fat_mass: data[index]['fat_mass'],
            ffm: data[index]['ffm'],
            fat_right_leg_m: data[index]['fat_right_leg_m'],
            fat_left_leg_m: data[index]['fat_left_leg_m'],
            fat_right_arm_m: data[index]['fat_right_arm_m'],
            fat_left_arm_m: data[index]['fat_left_arm_m'],
            fat_trunk_m: data[index]['fat_trunk_m'],
            smm: data[index]['smm'],
            lower_weight: data[index]['lower_weight'],
            upper_weight: data[index]['upper_weight'],
            lower_bmi: data[index]['lower_bmi'],
            upper_bmi: data[index]['upper_bmi'],
            lower_fat_p: data[index]['lower_fat_p'],
            upper_fat_p: data[index]['upper_fat_p'],
            lower_fat_m: data[index]['lower_fat_m'],
            upper_fat_m: data[index]['upper_fat_m'],
            lower_ffm: data[index]['lower_ffm'],
            upper_ffm: data[index]['upper_ffm'],
            fat_physique_rating: data[index]['fat_physique_rating'],
            lower_muscle_m: data[index]['lower_muscle_m'],
            upper_muscle_m: data[index]['upper_muscle_m'],
            muscle_physique_rating: data[index]['muscle_physique_rating'],
            physique_rating: data[index]['physique_rating'],
            center: data[index]['center'])));
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

final class MyTestsSeeDetail extends MyTestsState {
  final int dataIndex;

  const MyTestsSeeDetail({required super.tests, required this.dataIndex});
}
