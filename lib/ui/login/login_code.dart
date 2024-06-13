import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:sharif_health_app/model/login/login_cubit.dart';

class LoginCode extends StatefulWidget {
  const LoginCode({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  State<LoginCode> createState() => _LoginCodeState();
}

class _LoginCodeState extends State<LoginCode> {
  int retryTime = 12;

  final String title = "تایید شماره موبایل";

  final String detail = "کد ارسالی به شماره {} را وارد کنید";

  final String buttonTextOk1 = "ارسال پیامک";

  final String buttonTextOk2 = " {} " "ثانیه تا ارسال مجدد";

  final String buttonTextBack = "ویرایش شماره موبایل";

  _LoginCodeState() {
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/6.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: getForm(context),
    );
  }

  Widget getForm(context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: Color.fromRGBO(200, 200, 200, 1),
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyDecorationWith(
      color: Color.fromRGBO(234, 239, 243, 1),
    );

    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .3,
          child: Image.asset("assets/7.png"),
        ),
        SizedBox(
          height: 30,
          child: Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        SizedBox(
          height: 30,
          child: Text(
            detail.replaceAll('{}', widget.phoneNumber),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        Container(
          height: 50 + 25,
          padding: EdgeInsets.only(top: 5, bottom: 20),
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
        Container(
          height: 50,
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * .2,
              right: MediaQuery.of(context).size.width * .2),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
              ),
              padding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
            ),
            onPressed: (retryTime > 0)
                ? null
                : () {
                    BlocProvider.of<LoginCubit>(context).sendSms();
                  },
            child: Ink.image(
              colorFilter: (retryTime > 0)
                  ? const ColorFilter.mode(Colors.grey, BlendMode.darken)
                  : null,
              image: const AssetImage('assets/5.png'),
              fit: BoxFit.cover,
              child: Center(
                child: Text(
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(color: Colors.white),
                    (retryTime > 0)
                        ? buttonTextOk2.replaceAll('{}', retryTime.toString())
                        : buttonTextOk1),
              ),
            ),
          ),
        ),
        SizedBox(
            height: 50,
            width: 200,
            child: TextButton(
                onPressed: () {
                  BlocProvider.of<LoginCubit>(context).goPhoneNumber();
                },
                child: Row(children: [
                  const Icon(Icons.arrow_back_ios),
                  Text(
                    buttonTextBack,
                    style: const TextStyle(color: Colors.red),
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
