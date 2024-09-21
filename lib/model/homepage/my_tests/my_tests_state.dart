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
      {required this.center,
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

  dynamic getAttribute(name) {
    switch (name) {
      case 'device_model':
        return device_model;
      case 'load_dt':
        return load_dt;
      case 'date':
        return date;
      case 'time':
        return time;
      case 'gender':
        return gender;
      case 'age':
        return age;
      case 'height':
        return height;
      case 'active_level':
        return active_level;
      case 'weight':
        return weight;
      case 'bmi':
        return bmi;
      case 'fat_percentage':
        return fat_percentage;
      case 'fat_right_arm_p':
        return fat_right_arm_p;
      case 'fat_left_arm_p':
        return fat_left_arm_p;
      case 'fat_right_leg_p':
        return fat_right_leg_p;
      case 'fat_left_leg_p':
        return fat_left_leg_p;
      case 'fat_trunk_p':
        return fat_trunk_p;
      case 'muscle_mass':
        return muscle_mass;
      case 'muscle_right_arm_m':
        return muscle_right_arm_m;
      case 'muscle_left_arm_m':
        return muscle_left_arm_m;
      case 'muscle_right_leg_m':
        return muscle_right_leg_m;
      case 'muscle_left_leg_m':
        return muscle_left_leg_m;
      case 'muscle_trunk_m':
        return muscle_trunk_m;
      case 'bone_mass':
        return bone_mass;
      case 'visceral_fat_rating':
        return visceral_fat_rating;
      case 'bmr':
        return bmr;
      case 'metabolic_age':
        return metabolic_age;
      case 'total_water_percentage':
        return total_water_percentage;
      case 'total_water_weight':
        return total_water_weight;
      case 'fat_mass':
        return fat_mass;
      case 'ffm':
        return ffm;
      case 'fat_right_leg_m':
        return fat_right_leg_m;
      case 'fat_left_leg_m':
        return fat_left_leg_m;
      case 'fat_right_arm_m':
        return fat_right_arm_m;
      case 'fat_left_arm_m':
        return fat_left_arm_m;
      case 'fat_trunk_m':
        return fat_trunk_m;
      case 'smm':
        return smm;
      case 'lower_weight':
        return lower_weight;
      case 'upper_weight':
        return upper_weight;
      case 'lower_bmi':
        return lower_bmi;
      case 'upper_bmi':
        return upper_bmi;
      case 'lower_fat_p':
        return lower_fat_p;
      case 'upper_fat_p':
        return upper_fat_p;
      case 'lower_fat_m':
        return lower_fat_m;
      case 'upper_fat_m':
        return upper_fat_m;
      case 'lower_ffm':
        return lower_ffm;
      case 'upper_ffm':
        return upper_ffm;
      case 'fat_physique_rating':
        return fat_physique_rating;
      case 'lower_muscle_m':
        return lower_muscle_m;
      case 'upper_muscle_m':
        return upper_muscle_m;
      case 'muscle_physique_rating':
        return muscle_physique_rating;
      case 'physique_rating':
        return physique_rating;
      case 'center':
        return this.center;
    }
  }

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

  Map rangeDict(String key) {
    Map data = {
      'lower_$key':getAttribute('lower_$key'),
      'upper_$key':getAttribute('upper_$key')
    };
    return data;
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

final class MyTestsSeeHistory extends MyTestsSeeDetail {
  final String name;

  const MyTestsSeeHistory(
      {required super.tests, required super.dataIndex, required this.name});

  List<Map> getHistoryData() {
    return tests
        .map<Map>((DeviceData test) =>
            {"x": test.getHijriFormatDate(), "y": test.getAttribute(name)})
        .toList();
  }
}
