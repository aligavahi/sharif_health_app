import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:sharif_health_app/model/login/login_cubit.dart';
import 'package:sharif_health_app/utils/app_colors.dart';

class LoginCode extends StatefulWidget {
  const LoginCode({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  State<LoginCode> createState() => _LoginCodeState();
}

class _LoginCodeState extends State<LoginCode> {
  int retryTime = 120;

  final String title = "تایید شماره موبایل";

  final String detail = "کد ارسالی به شماره {} را وارد کنید";

  final String buttonTextOk1 = "ارسال مجدد پیامک";

  final String buttonTextOk2 = " {} " "ثانیه تا ارسال مجدد";

  final String buttonTextBack = "ویرایش شماره همراه";

  _LoginCodeState() {
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.topCenter,
          fit: BoxFit.fitWidth,
          image: AssetImage("assets/page3/code_input_top.png"),
        ),
      ),
      child: getForm(context),
    );
  }
  

  Widget getForm(context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(246, 246, 246, 1),
        border: Border.all(color: Color.fromARGB(237, 234, 239, 243)),
        borderRadius: BorderRadius.circular(27),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromARGB(136, 253, 132, 11)),
      borderRadius: BorderRadius.circular(27),
    );

    final submittedPinTheme = defaultPinTheme.copyDecorationWith(
      color: const Color.fromRGBO(234, 239, 243, 1),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
         height: MediaQuery.of(context).size.height * .3,
        ),
        SizedBox(
          height: 95,
          width: 101,
          child: Image.asset("assets/page3/code_input_icon.png"),
        ),
        const SizedBox(height: 24,),
        SizedBox(
          height: 30,
          child: Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),
          ),
        ),
        const SizedBox(height: 24,),
        SizedBox(
          height: 30,
          child: Text(
            detail.replaceAll('{}', widget.phoneNumber),
            style: const TextStyle(color: AppColors.shadow, fontSize: 14),
          ),
        ),
        Container(
          height: 100,
          padding: const EdgeInsets.only(top: 5, bottom: 20),
          child: Pinput(
            length: 4,
            defaultPinTheme: defaultPinTheme,
            focusedPinTheme: focusedPinTheme,
            submittedPinTheme: submittedPinTheme,
            onCompleted: (pin) {
              BlocProvider.of<LoginCubit>(context).login(pin);
            },
          ),
        ),
        ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(288, 54),
                  backgroundColor:
                      (retryTime > 0) ? AppColors.shadow : AppColors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(27.0),
                  ),
                  padding: EdgeInsets.zero,
                  elevation: 4,
                ),
                onPressed: () {
                  (retryTime > 0)
                      ? confirmDialog(context, "توجه",
                          "لطفا تا پایان زمان درخواست مجدد منتظر بمانید", [
                          {'text': 'باشه'},
                        ])
                      : BlocProvider.of<LoginCubit>(context).sendSms();
                },
                child: SizedBox(
                  width:max(150,MediaQuery.of(context).size.width * .3),
                  height: 54,
                  child: Center(
                    child: Text(
                        textDirection: TextDirection.rtl,
                        style: const TextStyle(color: Colors.white),
                        (retryTime > 0)
                            ? buttonTextOk2.replaceAll(
                                '{}', retryTime.toString())
                            : buttonTextOk1),
                  ),
                )),
        SizedBox(
            height: 50,
            child: TextButton(
                onPressed: () {
                  BlocProvider.of<LoginCubit>(context).goPhoneNumber();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  const Icon(Icons.arrow_back_ios, color: Colors.red,size: 12,),
                  Text(
                    buttonTextBack,
                    style: const TextStyle(color: Colors.red,fontSize: 12),
                  ),
                ])))
      ],
    );
  }

  void startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        retryTime = 0;
        timer.cancel();
        return;
      }
      if (retryTime > 0) {
        setState(() {
          retryTime -= 1;
        });
      }
      if (retryTime <= 0 && timer.isActive) {
        timer.cancel();
      }
    });
  }
}

Future<bool?> confirmDialog(context, String title, String message,
    List<Map<String, dynamic>> buttons) async {
  return await showDialog<bool>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title, textDirection: TextDirection.rtl),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: buttons
              .map((button) => TextButton(
                    child: Text(button['text']),
                    onPressed: () {
                      Navigator.pop(context, button['value']);
                    },
                  ))
              .toList(),
        );
      });
}
