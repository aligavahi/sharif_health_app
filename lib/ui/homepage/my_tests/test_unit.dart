import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharif_health_app/model/homepage/my_tests/my_tests_cubit.dart';
import 'package:sharif_health_app/utils/app_colors.dart';

class TestUnit extends StatelessWidget {
  final String testNumberPlaceHolder = "تست شماره {}";
  final int index;
  final DeviceData test;

  const TestUnit({super.key, required this.index, required this.test});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 120,
        child: Card(
            color: AppColors.white,
            child: InkWell(
                highlightColor: AppColors.green,
                onTap: () {
                  BlocProvider.of<MyTestsCubit>(context).checkDetail(index);
                },
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/mytests/test_image.png",
                        ),
                        colorFilter: ColorFilter.linearToSrgbGamma(),
                        fit: BoxFit.fitHeight,
                        alignment: Alignment.centerLeft),
                  ),
                  child: Row(children: [
                    const Spacer(
                      flex: 5,
                    ),
                    Expanded(
                        flex: 5,
                        child: Column(children: [
                          Expanded(
                              child: ListTile(
                            title: Text(
                                testNumberPlaceHolder.replaceAll(
                                    "{}", (index + 1).toString()),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                textDirection: TextDirection.rtl),
                          )),
                          Expanded(
                              child: ListTile(
                                  trailing: const Icon(
                                    Icons.calendar_month_outlined,
                                    color: AppColors.orange,
                                  ),
                                  title: Text(
                                    test.getHijriFormatDate(),
                                    textDirection: TextDirection.rtl,
                                    style: const TextStyle(fontSize: 12),
                                  ))),
                          Expanded(
                              child: ListTile(
                                  trailing: const Icon(Icons.location_pin,
                                      color: AppColors.orange),
                                  title: Text(test.center,
                                      textDirection: TextDirection.rtl,
                                      style: const TextStyle(fontSize: 12)))),
                        ])),
                    Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Center(
                          child: Image.asset(
                            "assets/mytests/test_icon.png",
                            color: AppColors.green,
                          ),
                        )),
                  ]),
                ))));
  }
}
