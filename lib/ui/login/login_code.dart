import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:sharif_health_app/model/login/login_cubit.dart';

class LoginCode extends StatelessWidget {
  const LoginCode({super.key});

  final String title = "تایید شماره موبایل";
  final String detail = "کد ارسالی به شماره {} را وارد کنید";
  final String buttonTextOk1 = "ارسال";
  final String buttonTextOk2 = "{} ثانیه تا ارسال مجدد";
  final String buttonTextBack = "ویرایش شماره موبایل";

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
            detail,
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
              elevation: 4,
              backgroundColor: Colors.transparent,
            ),
            onPressed: () {},
            child: Ink.image(
              image: const AssetImage('assets/5.png'),
              fit: BoxFit.cover,
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Center(
                  child: Text(
                      style: const TextStyle(color: Colors.white),
                      buttonTextOk1),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
            height: 50,
            width: 200,
            child: TextButton(
                onPressed: () {},
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
}
