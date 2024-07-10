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

class PersonalInfoSection extends StatelessWidget {
  PersonalInfoSection(this.state,{super.key});
  final ProfileEdit state;
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    return Directionality(
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
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                    labelText: 'نام'),
              ),
              const SizedBox(height: spacing),
              FormBuilderTextField(
                name: 'last_name',
                initialValue: state.profileData['last_name'],
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
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
                    builder: (buildContext) => DateDialog(
                        BlocProvider.of<ProfileCubit>(context))),
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
              FormBuilderChoiceChip(
                initialValue: state.profileData['gender'],

                options: [
                  FormBuilderChipOption(value: 'مرد'),
                  FormBuilderChipOption(value: 'زن'),
                ],
                labelPadding: EdgeInsets.all(10),
                spacing: 10,
                name: 'gender',
                decoration: const InputDecoration(
                    border: InputBorder.none, labelText: 'جنسیت'),
              ),
              const SizedBox(height: spacing),
              FormBuilderChoiceChip(
                options: [
                  FormBuilderChipOption(value: 'متاهل'),
                  FormBuilderChipOption(value: 'مجرد'),
                ],
                labelPadding: EdgeInsets.all(10),
                spacing: 10,
                initialValue: state.profileData['marital_status'],

                name: 'marital_status',
                decoration: const InputDecoration(
                    border: InputBorder.none, labelText: 'وضعیت تاهل'),
              ),
              const SizedBox(height: 20),
              MaterialButton(
                color: Theme.of(context).colorScheme.secondary,
                onPressed: () {
                  // Validate and save the form values
                  _formKey.currentState?.saveAndValidate();
                  Map<String, dynamic> data = _formKey.currentState!.value;
                  debugPrint(data.toString());
                  Map<String, dynamic> newData = {};

                  data.forEach((k, v) {

                    if (v != null) {
                      if (k=='birth_date'){
                        newData[k] = to_gregori(v);
                      }else{
                        newData[k] = v;

                      }
                    }
                  });
                  BlocProvider.of<ProfileCubit>(context)
                      .submitPersonalInfo(newData);
                },
                child: const Text('ذخیره'),
              )
            ],
          ),
        ));
  }

  to_jalali(stringDate) {
    intl.DateFormat format = new intl.DateFormat("yyyy-MM-dd");
    DateTime dateTime =  format.parse(stringDate);
    Gregorian gregorian = Gregorian.fromDateTime(dateTime);
    Jalali jalali = Jalali.fromGregorian(gregorian);
    final f = jalali.formatter;
    return "${f.yyyy}-${f.mm}-${f.dd}";
  }

  to_gregori(String? stringDate) {
    if(stringDate != null) {
      List<String> stringList = stringDate.split('-');
      if (stringList.length==3) {
        final DateTime gre =
        Jalali(int.parse(stringList[0]), int.parse(stringList[1]), int.parse(stringList[2])).toDateTime();
        return intl.DateFormat('yyyy-MM-dd').format(gre);
      }
      return "";
    }
    return "";
  }

}
