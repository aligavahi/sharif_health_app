import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharif_health_app/model/login/login_cubit.dart';
import 'package:sharif_health_app/utils/app_colors.dart';

class FirstPage extends StatelessWidget {
  final String text = 'دستیار سلامتی و تناسب اندام شما';

  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) => Future.delayed(
        const Duration(seconds: 1,milliseconds: 500),
        () => BlocProvider.of<LoginCubit>(context).goPhoneNumber()));

    return Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/page1/background.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Column(
            children: [
              const Spacer(flex: 5),
              SizedBox(
                  height: MediaQuery.of(context).size.height * .3,
                  width: MediaQuery.of(context).size.width * .5,
                  child: Image.asset("assets/page1/icon1.png")),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Text(
                  text,
                  style: const TextStyle(
                      color: AppColors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 10),
                ),
              ),
              const Spacer(flex: 3),
              SizedBox(
                  height: MediaQuery.of(context).size.height * .3,
                  width: MediaQuery.of(context).size.width * .5,
                  child: Image.asset("assets/page1/icon2.png")),
              const Spacer(flex: 2),
            ],
          ),
        ));
  }
}
