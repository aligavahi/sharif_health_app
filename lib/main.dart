import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharif_health_app/model/homepage/homepage_cubit.dart';
import 'package:sharif_health_app/model/login/login_cubit.dart';
import 'package:sharif_health_app/ui/homepage/navigation/admin_home_page.dart';
import 'package:sharif_health_app/ui/homepage/navigation/trainee_home_page.dart';
import 'package:sharif_health_app/ui/homepage/navigation/trainer_home_page.dart';
import 'package:sharif_health_app/ui/login/first_page.dart';
import 'package:sharif_health_app/ui/login/login_code.dart';
import 'package:sharif_health_app/ui/login/login_phone_number.dart';
import 'package:sharif_health_app/utils/app_thems.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'سلامت شربف', theme: appTheme, routes: {
      '/': (context) => loginPage(),
      '/home': (context) => homePage()
    });
  }

  Widget loginPage() {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocProvider<LoginCubit>(
          create: (BuildContext context) => LoginCubit(),
          child:
              BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
            if (state is LoginSuccess) {
                Navigator.pushNamed(context, '/home');
            }
          }, builder: (context, state) {
                if (state is LoginFirstPage) return FirstPage(context: context,);
                if (state is LoginInitial || state is LoginFailedSms) {
                  return const LoginPhoneNumber();
                }
                if (state is LoginCodeSent || state is LoginFailedCode) {
                  return LoginCode(phoneNumber: state.phoneNumber);
                }
                return FirstPage(context: context,);
          }),
        ));
  }

  Widget homePage() {
    return Scaffold(
        body: BlocProvider<HomepageCubit>(
      create: (BuildContext context) => HomepageCubit(),
            child: BlocConsumer<HomepageCubit, HomepageState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is HomepageInitial) {
                    switch(state.selectedRole){
                      case Role.trainee:
                        return TraineeHomePage(index: state.pageNumber);
                      case Role.trainer:
                        return TrainerHomePage(index: state.pageNumber);
                      case Role.admin:
                        return AdminHomePage(index: state.pageNumber);
                    }
                  }
                  return const Text("invalid state");
                }),
    ));
  }
}
