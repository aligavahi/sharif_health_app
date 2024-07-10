import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:sharif_health_app/model/homepage/profile/profile_cubit.dart';

class DateDialog extends StatelessWidget {
  final ProfileCubit profileCubit;

  DateDialog(this.profileCubit, {super.key});


  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      actionsPadding: EdgeInsets.only(bottom: 20, left: 10, right: 10),
      contentPadding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 15),
      titlePadding: EdgeInsets.zero,
      actionsAlignment: MainAxisAlignment.center,
      title: ListTile(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(19), topRight: Radius.circular(19))),
        title: Center(
          child: Text(
            'انتخاب تاریخ',
            textDirection: TextDirection.rtl,
          ),
        ),
        trailing: Icon(Icons.date_range),
      ),
      content: get_menu(),
      actions: [
        SizedBox(
            width: MediaQuery.of(context).size.width * .25,
            child: ElevatedButton(
                onPressed: () {
                  _formKey.currentState?.saveAndValidate();
                  Map<String, dynamic> data = _formKey.currentState!.value;
                  profileCubit.onDateEdit(data['year'],data['month'],data['day']);
                  Navigator.pop(context);
                },
                child: Text('تایید'))),
      ],
    );
  }

  get_menu() {
    return FormBuilder(
        key: _formKey,
        child: Row(children: [
          Expanded(
            child: FormBuilderDropdown<String>(
                alignment: Alignment.center,
                menuMaxHeight: 220,
                name: 'year',
                items: List<DropdownMenuItem<String>>.generate(
                  90,
                  (index) {
                    int y = Jalali.now().addYears(-index-5).year;
                    return DropdownMenuItem(
                      child: Center(child: Text(y.toString())),
                      value: y.toString(),
                    );
                  },
                )),
          ),
          Expanded(
            child: FormBuilderDropdown<String>(
                alignment: Alignment.center,
                name: 'month',
                menuMaxHeight: 220,
                items: List<DropdownMenuItem<String>>.generate(
                  12,
                      (index) => DropdownMenuItem(
                    child: Center(child: Text((index+1).toString())),
                    value: (index+1).toString(),
                  ),
                )),
          ),
          Expanded(
            child: FormBuilderDropdown<String>(
                alignment: Alignment.center,
                name: 'day',
                menuMaxHeight: 220,
                items: List<DropdownMenuItem<String>>.generate(
                  31,
                      (index) => DropdownMenuItem(
                    child: Center(child: Text(index.toString())),
                    value: index.toString(),
                  ),
                )),
          ),
        ]));
  }
}
