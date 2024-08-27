import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharif_health_app/model/homepage/my_tests/my_tests_cubit.dart';
import 'package:sharif_health_app/ui/homepage/my_tests/test_summary_section.dart';
import 'package:sharif_health_app/ui/homepage/my_tests/test_unit.dart';
import 'package:sharif_health_app/utils/app_colors.dart';

class MyTestsPage extends StatelessWidget {
  const MyTestsPage({super.key});

  final style = const TextStyle(color: Colors.white);
  final String title = "تست های انجام شده";

  final String emptyDetail = """
شما تا کنون تستی در مراکز سلامت شریف انجام نداده‌اید ویا داده‌های شما هنوزدریافت نگردیده است.
در صورتی که تست را انجام داده‌اید، لطفا صبور باشید، به زودی آنالیز شما در دسترس خواهد بود.
برای دریافت لیست مراکز انجام تست کلیک کنید.
  """;

  final String notEmptyDetail = """
  لیست مراکز انجام تست
  """;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider<MyTestsCubit>(
      create: (BuildContext context) => MyTestsCubit(),
      child: BlocConsumer<MyTestsCubit, MyTestsState>(
          listener: (context, state) {},
          builder: (context, state) {
            Widget inner;
            if (state is MyTestsDataReady) {
              if (state.tests.isNotEmpty) {
                inner = getTestsPage(state.tests, context);
              } else {
                inner = getEmptyTestPage();
              }
              return Scaffold(
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    title: Center(child:Text(title)),
                  ),
                  body: Container(
                    color: AppColors.background,
                    padding:
                        const EdgeInsets.only(left: 12, right: 10, bottom: 12),
                    child: inner,
                  ));
            } else if (state is MyTestsSeeDetail) {
              return getDetailSection(state.tests[state.dataIndex], context);
            }
            return const Center(
                child: Text(
              "در حال دریافت اطلاعات ...",
              textDirection: TextDirection.rtl,
            ));
          }),
    ));
  }

  Widget getFooterNote() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.blueAccent.withOpacity(.4),
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.all(6),
      child: Center(
          child: InkWell(
              onTap: () {},
              child: Text(
                emptyDetail,
                textDirection: TextDirection.rtl,
              ))),
    );
  }

  Widget getEmptyTestPage() {
    return Column(children: [
      Expanded(
          child: Image.asset(
        "assets/mytests/no_data.png",
        fit: BoxFit.fitWidth,
      )),
      getFooterNote()
    ]);
  }

  Widget getTestsPage(List<DeviceData> tests, context) {
    return Column(children: [
      Container(
          child: Expanded(
              child: ListView(
                  children: List<Widget>.generate(tests.length,
                      (index) => TestUnit(index: index, test: tests[index]))))),
    ]);
  }

  Widget getDetailSection(DeviceData test, BuildContext context) {
    return TestSummarySection(data: test);
  }
}
