import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharif_health_app/model/homepage/my_tests/my_tests_cubit.dart';
import 'package:sharif_health_app/utils/app_colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HistorySection extends StatelessWidget {
  final String name;
  final List<Map> data;

  const HistorySection({super.key, required this.name, required this.data});

  @override
  Widget build(BuildContext context) {
    final Map<String, String> ranges = {"": ""};

    final Map<String, String> details = {
      "weight": """
مجموع توده چربی (Fat Mass) و توده بدون چربی (Fat Free Mass).
وزن بدن مجموع جرم تمام اجزای تشکیل دهنده بدن شامل عضلات، استخوان‌ها، اندام‌ها، مایعات بدن، چربی و سایر بافت‌ها است. این پارامتر به تنهایی نمی‌تواند نشان‌دهنده سلامت کلی باشد، اما در ترکیب با سایر شاخص‌ها می‌تواند اطلاعات مفیدی در مورد وضعیت سلامت فردی ارائه دهد.
      """
    };

    final Map<String, String> title = {
      "weight": "وزن بدن چیست؟",
    };

    Widget chartWidget = SfCartesianChart(
        plotAreaBorderColor: Colors.transparent,
        primaryXAxis: const CategoryAxis(
          majorGridLines: MajorGridLines(width: 0),
          borderWidth: 0,
        ),
        series: <CartesianSeries>[
          SplineSeries<Map, String>(
            splineType: SplineType.natural,
            dataSource: data,
            xValueMapper: (Map item, _) => item['x'],
            yValueMapper: (Map item, _) => item['y'],
            color: AppColors.white,
            markerSettings: const MarkerSettings(
              isVisible: true,
              shape: DataMarkerType.circle,
              color: AppColors.orange,
            ),
          ),
        ]);
    Widget rangeWidget = Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: AppColors.white,
      ),
      width: MediaQuery.of(context).size.width * .6,
      height: 140,
      child: Column(
        children: [
          Container(
            height: 30,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
              color: AppColors.orange,
            ),
            width: MediaQuery.of(context).size.width * .3,
            child: Center(
              child: const Text(
                "بازه و محدوده شما",
                style: TextStyle(
                    color: AppColors.white, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
              child: Container(
            child: Text(
              ranges[name] ?? "",
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
            ),
          )),
        ],
      ),
    );
    Widget stackWidget = Stack(
      fit: StackFit.passthrough,
      children: [
        Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              color: AppColors.green,
            ),
            margin: const EdgeInsets.only(bottom: 80),
            padding: const EdgeInsets.only(bottom: 80),
            height: MediaQuery.of(context).size.height * .5,
            child: chartWidget),
        Positioned(
          bottom: 0,
          left: MediaQuery.of(context).size.width * .2,
          child: Center(child: rangeWidget),
        )
      ],
    );
    Widget titleText = Text(
      title[name] ?? "",
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
      style: const TextStyle(fontWeight: FontWeight.bold),
    );
    Widget detailText = Text(
      details[name] ?? "",
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
    );
    return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: const Center(child: Text("تاریخچه")),
          leading: InkWell(
              child: const Icon(Icons.arrow_back),
              onTap: () =>
                  BlocProvider.of<MyTestsCubit>(context).goBackDetail()),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            stackWidget,
            Padding(padding: const EdgeInsets.all(20), child: titleText),
            Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: detailText)
          ],
        ));
  }
}
