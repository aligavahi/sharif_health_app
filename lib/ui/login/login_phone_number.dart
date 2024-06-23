import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharif_health_app/model/login/login_cubit.dart';

class LoginPhoneNumber extends StatelessWidget {
  const LoginPhoneNumber({super.key});

  final String title = "ورود | ثبت نام";
  final String detail = "به منظور ورود شماره همراه خود را وارد کنید";
  final String buttonText = "ورود";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/4.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: getForm(context),
    );
  }

  Widget getForm(context) {
    double max_item_height = MediaQuery.of(context).size.height * .35 / 4;
    return Container(
        margin: EdgeInsets.fromLTRB(
          40,
          MediaQuery.of(context).size.height * .15,
          40,
          MediaQuery.of(context).size.height * .20,
        ),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Color.fromRGBO(245, 245, 245, 1),
            borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .25,
                child: Image.asset("assets/3.png"),
              ),
            ),
            Center(
              child: SizedBox(
                height: min(30.0,max_item_height),
                child: Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: min(30,max_item_height),
              child: Text(detail),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20.0)),
              height: min(50.0,max_item_height),
              child: Row(children: [
                Icon(Icons.phone),
                Spacer(),
                Expanded(
                  flex: 20,
                  child: TextField(
                      onChanged: (value) {
                        BlocProvider.of<LoginCubit>(context)
                            .updatePhoneNumber(value);
                      },
                      decoration: InputDecoration(border: InputBorder.none)),
                )
              ]),
            ),
            const Spacer(
              flex: 4,
            ),
            Container(
              height: min(50.0,max_item_height),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  padding: EdgeInsets.zero,
                  elevation: 4,
                ),
                onPressed: () {
                  BlocProvider.of<LoginCubit>(context).sendSms();
                },
                child: Ink.image(
                  image: const AssetImage('assets/5.png'),
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Center(
                      child: Text(
                          style: const TextStyle(color: Colors.white),
                          buttonText),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
