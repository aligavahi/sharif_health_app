import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart' as intl;
import 'package:shamsi_date/shamsi_date.dart';
import 'package:sharif_health_app/model/homepage/profile/profile_cubit.dart';
import 'package:sharif_health_app/ui/homepage/profile/date_dialog.dart';
import 'package:sharif_health_app/ui/homepage/profile/education_dialog.dart';
import 'package:sharif_health_app/utils/app_colors.dart';

class PersonalInfoSection extends StatelessWidget {
  PersonalInfoSection(this.state, {super.key});

  final ProfileEdit state;
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Center(child: Text("اطلاعات شخصی")),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            BlocProvider.of<ProfileCubit>(context).backToProfile();
          },
        ),
      ),
      body: get_form(context),
    );
  }

  get_form(context) {
    const double spacing = 20;
    return Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(15)),
        child: Directionality(
            textDirection: TextDirection.rtl,
            child: FormBuilder(
              key: _formKey,
              child: ListView(
                padding: EdgeInsets.all(20),
                children: [
                  FormBuilderTextField(
                    initialValue: state.profileData['first_name'],
                    name: 'first_name',
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person_2_outlined),
                        border: OutlineInputBorder(),
                        labelText: 'نام'),
                  ),
                  const SizedBox(height: spacing),
                  FormBuilderTextField(
                    name: 'last_name',
                    initialValue: state.profileData['last_name'],
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person_2_outlined),
                        border: OutlineInputBorder(),
                        labelText: 'نام خانوادگی'),
                  ),
                  const SizedBox(height: spacing),
                  FormBuilderTextField(
                    onTap: () => showDialog(
                        context: context,
                        builder: (buildContext) => EducationDialog(
                            BlocProvider.of<ProfileCubit>(context))),
                    name: 'education',
                    initialValue: state.profileData['education'],
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.school_outlined),
                        border: OutlineInputBorder(),
                        labelText: 'تحصیلات'),
                  ),
                  const SizedBox(height: spacing),
                  FormBuilderTextField(
                    onTap: () => showDialog(
                        context: context,
                        builder: (buildContext) =>
                            DateDialog(BlocProvider.of<ProfileCubit>(context))),
                    name: 'birth_date',
                    initialValue: to_jalali(state.profileData['birth_date']),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.calendar_today_outlined),
                        border: OutlineInputBorder(),
                        labelText: 'تاریخ تولد'),
                  ),
                  const SizedBox(height: spacing),
                  FormBuilderTextField(
                    initialValue: state.profileData['address'],
                    name: 'address',
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.home_outlined),
                        border: OutlineInputBorder(),
                        labelText: 'آدرس'),
                  ),
                  const SizedBox(height: spacing),
                  FormBuilderTextField(
                    name: 'email',
                    initialValue: state.profileData['email'],
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        border: OutlineInputBorder(),
                        labelText: 'پست الکترونیک'),
                  ),
                  const SizedBox(height: spacing),
                  const Text("جنسیت"),
                  const SizedBox(height: spacing / 3),
                  FormBuilderRadioGroup(
                    wrapSpacing: 5,
                    itemDecoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10)),
                    initialValue: state.profileData['gender'],
                    options: [getChoiceItem('مرد'), getChoiceItem('زن')],
                    name: 'gender',
                    decoration: const InputDecoration(border: InputBorder.none),
                  ),
                  const SizedBox(height: spacing),
                  const Text("وضعیت تاهل"),
                  const SizedBox(height: spacing / 3),
                  FormBuilderRadioGroup(
                    options: [
                      getChoiceItem('متاهل'),
                      getChoiceItem('مجرد'),
                    ],
                    wrapSpacing: 5,
                    itemDecoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10)),
                    initialValue: state.profileData['marital_status'],
                    name: 'marital_status',
                    decoration: const InputDecoration(border: InputBorder.none),
                  ),
                  const SizedBox(height: 20),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    height: 60,
                    color: AppColors.green,
                    onPressed: () {
                      _formKey.currentState?.saveAndValidate();
                      Map<String, dynamic> data = _formKey.currentState!.value;
                      Map<String, dynamic> newData = {};

                      data.forEach((k, v) {
                        if (v != null) {
                          if (k == 'birth_date') {
                            newData[k] = to_gregori(v);
                          } else {
                            newData[k] = v;
                          }
                        }
                      });
                      BlocProvider.of<ProfileCubit>(context)
                          .submitPersonalInfo(newData);
                    },
                    child: const Text(
                      'ذخیره',
                      style: TextStyle(
                          color: AppColors.white, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            )));
  }

  to_jalali(String? stringDate) {
    if (stringDate != null) {
      intl.DateFormat format = new intl.DateFormat("yyyy-MM-dd");
      DateTime dateTime = format.parse(stringDate);
      Gregorian gregorian = Gregorian.fromDateTime(dateTime);
      Jalali jalali = Jalali.fromGregorian(gregorian);
      final f = jalali.formatter;
      return "${f.yyyy}-${f.mm}-${f.dd}";
    }
  }

  to_gregori(String? stringDate) {
    if (stringDate != null) {
      List<String> stringList = stringDate.split('-');
      if (stringList.length == 3) {
        final DateTime gre = Jalali(int.parse(stringList[0]),
                int.parse(stringList[1]), int.parse(stringList[2]))
            .toDateTime();
        return intl.DateFormat('yyyy-MM-dd').format(gre);
      }
      return "";
    }
    return "";
  }

  FormBuilderFieldOption getChoiceItem(val) {
    return FormBuilderFieldOption(
        value: val,
        child: SizedBox(
            width: 60,
            height: 45,
            child: Container(
                alignment: Alignment.centerRight,
                child: Text(
                  val,
                ))));
  }
}
