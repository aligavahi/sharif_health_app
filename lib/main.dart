import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharif_health_app/model/login/login_cubit.dart';
import 'package:sharif_health_app/ui/login/first_page.dart';
import 'package:sharif_health_app/ui/login/login_code.dart';
import 'package:sharif_health_app/ui/login/login_phone_number.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
            body: BlocProvider<LoginCubit>(
          create: (BuildContext context) => LoginCubit(),
          child: BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is LoginFirstPage) return FirstPage();
                if (state is LoginInitial || state is LoginFailedSms) return LoginPhoneNumber();
                if (state is LoginCodeSent || state is LoginFailedCode) return LoginCode();
                return  FirstPage();
              }),
        )));
  }
}
