import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
          MediaQuery.of(context).size.height * .07,
        ),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              width: 51,
              height: 51,
              child: Image.asset("assets/page2/login_icon.png"),
            ),
            const SizedBox(
              height: 30,
            ),
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
                        const SizedBox(
                          height: 16,
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
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 5,
                      height: 74,
                      decoration: BoxDecoration(
                        color: AppColors.green,
                        borderRadius: BorderRadius.circular(2.5),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Spacer(),
            Expanded(
              flex: 20,
              child: TextFormField(
                showCursor: true,
                textAlign: TextAlign.left,
                textDirection: TextDirection.ltr,
                decoration: InputDecoration(
                  labelText: "شماره همراه",
                  contentPadding:
                      const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22.0)),
                  prefixIcon:
                      const Icon(Icons.phone_rounded, color: AppColors.shadow),
                  prefix: const Text("+98 ", textDirection: TextDirection.ltr),
                ),
                autofocus: true,
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                ],
                onChanged: (value) {
                  BlocProvider.of<LoginCubit>(context).updatePhoneNumber(value);
                },
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
              ),
            ),
            const Spacer(),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                            buttonText),
                      ],
                    ),
                  )),
            ),
          ],
        ));
  }
}
