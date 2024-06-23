import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharif_health_app/model/homepage/my_tests/my_tests_cubit.dart';
import 'package:sharif_health_app/ui/homepage/my_tests/test_summary_section.dart';

class MyTestsPage extends StatelessWidget {
  const MyTestsPage({super.key});

  final style = const TextStyle(color: Colors.white);

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
              return Container(
                padding: EdgeInsets.only(left: 12, right: 10, bottom: 12),
                child: inner,
              );
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

  Widget getFooterNote(bool empty) {
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
                empty ? emptyDetail : notEmptyDetail,
                textDirection: TextDirection.rtl,
              ))),
    );
  }

  Widget getHeader() {
    return Container(
      height: 30,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.blueAccent),
      child: Row(
        children: [
          Spacer(flex: 3,),
          Text("تاریخ", style: style),
          Spacer(
            flex: 7,
          ),
          Text("مرکز تست", style: style),
          Spacer(
            flex: 5,
          ),
          Text("شماره", style: style),
          Spacer(flex: 2,),
        ],
      ),
    );
  }

  Widget getTests(List<DeviceData> tests, context) {
    return Expanded(
        child: ListView(
            children: List<SizedBox>.generate(
                tests.length,
                (index) => SizedBox(
                    height: 50,
                    child: Card(
                        child: InkWell(
                            highlightColor: Colors.green,
                            onTap: () {
                              BlocProvider.of<MyTestsCubit>(context)
                                  .checkDetail(index);
                            },
                            child: Row(children: [
                              const Spacer(),
                              Text(tests[index].getHijriFormatDate()),
                              const Spacer(
                                flex: 2,
                              ),
                              Text(tests[index].center),
                              const Spacer(
                                flex: 2,
                              ),
                              Text(index.toString()),
                              const Spacer(),
                            ])))))));
  }

  Widget getEmptyTestPage() {
    return Column(children: [
      getHeader(),
      Expanded(
          child: Image.asset(
        "assets/mytests/no_data.png",
        fit: BoxFit.fitWidth,
      )),
      getFooterNote(true)
    ]);
  }

  Widget getTestsPage(List<DeviceData> tests, context) {
    return Column(children: [
      getHeader(),
      Container(child: getTests(tests, context)),
      getFooterNote(false)
    ]);
  }

  Widget getDetailSection(DeviceData test, BuildContext context) {
    return TestSummarySection(data: test);
  }
}
