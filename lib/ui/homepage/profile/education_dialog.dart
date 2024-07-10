import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sharif_health_app/model/homepage/profile/profile_cubit.dart';

class EducationDialog extends StatelessWidget {
  final ProfileCubit profileCubit;

  EducationDialog(this.profileCubit, {super.key});

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
            'تصحیلات',
            textDirection: TextDirection.rtl,
          ),
        ),
        trailing: Icon(Icons.school_sharp),
      ),
      content: get_menu(),
      actions: [
        SizedBox(
            width: MediaQuery.of(context).size.width * .25,
            child: ElevatedButton(
                onPressed: () {
                  _formKey.currentState?.saveAndValidate();
                  Map<String, dynamic> data = _formKey.currentState!.value;
                  profileCubit.onEducationEdit(data['edu']);
                  Navigator.pop(context);
                },
                child: Text('تایید'))),
      ],
    );
  }

  get_menu() {
    return FormBuilder(
      key: _formKey,
      child: FormBuilderDropdown<String>(
        alignment: Alignment.center,
        name: 'edu',
        items: [
          DropdownMenuItem(child: Center(child: Text('کاردانی')),value: 'کاردانی',),
          DropdownMenuItem(child: Center(child: Text('کارشناسی')),value:'کارشناسی' ,),
          DropdownMenuItem(child: Center(child: Text('کارشناسی ارشد')),value: 'کارشناسی ارشد',),
          DropdownMenuItem(child: Center(child: Text('دکتری')),value: 'دکتری',),
        ],
        onChanged: (val){

        },
      ),
    );
  }
}
