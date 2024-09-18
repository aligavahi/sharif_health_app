import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharif_health_app/model/login/login_cubit.dart';
import 'package:sharif_health_app/utils/app_colors.dart';

class LoginPhoneNumber extends StatelessWidget {
  const LoginPhoneNumber({super.key});

  final String title = "ورود | ثبت نام";
  final String detail = "شماره همراه خود را وارد کنید";
  final String buttonText = "ورود";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/page2/login_number_input.png"),
        ),
      ),
      child: getForm(context),
    );
  }

  Widget getForm(BuildContext context) {
    double max_item_height = MediaQuery.of(context).size.height * .35 / 4;
    return Container(
        margin: EdgeInsets.fromLTRB(
          50,
          MediaQuery.of(context).size.height * .45,
          50,
          MediaQuery.of(context).size.height * .10,
        ),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: 51,
              height: 51,
              child: Image.asset("assets/page2/login_icon.png"),
            ),
            SizedBox(height: 30,),
            Container(
              alignment: Alignment.topRight,
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          detail,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.lightShadow),
                        ),
                      ],
                    ),
                    SizedBox(width: 5,),
                    SizedBox(
                        width: 5,
                        height: 74,
                        child: ColoredBox(color: AppColors.green)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            const Spacer(),
            Container(
              padding: const EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(27.0)),
              height: 57,
              child: Row(children: [
                Icon(Icons.phone_rounded),
                Spacer(),
                Expanded(
                  flex: 20,
                  child: TextField(
                      autofocus: true,
                      keyboardType: TextInputType.phone,
                      onChanged: (value) {
                        BlocProvider.of<LoginCubit>(context)
                            .updatePhoneNumber(value);
                      },
                      decoration: InputDecoration(border: InputBorder.none)),
                )
              ]),
            ),
            const Spacer(
              flex: 2,
            ),
            Container(
              height: 54,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(27.0)),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(27.0),
                  ),
                  padding: EdgeInsets.zero,
                  elevation: 4,
                ),
                onPressed: () {
                  BlocProvider.of<LoginCubit>(context).sendSms();
                },
                child: SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: Center(
                      child: Text(
                          style: const TextStyle(color: Colors.white),
                          buttonText),
                    ),
                ),
              ),
            ),
          ],
        ));
  }
}