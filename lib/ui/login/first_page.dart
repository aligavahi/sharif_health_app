import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharif_health_app/model/login/login_cubit.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/first1.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(children: [
          Spacer(),
          Container(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Column(
              children: [
                const Spacer(
                  flex: 2,
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height * .3,
                    child: Image.asset("assets/first2.png")),
                const Spacer(
                  flex: 8,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .6,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      padding: EdgeInsets.zero,
                      elevation: 4,
                      backgroundColor: Colors.transparent,
                    ),
                    onPressed: () {
                      BlocProvider.of<LoginCubit>(context).goPhoneNumber();
                    },
                    child: Ink.image(
                      image: const AssetImage('assets/2.png'),
                      fit: BoxFit.cover,
                      child: const SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: Center(
                          child: Text(
                            'ورود/ثبت نام',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
          ),
          Spacer()
        ]));
  }
}
