import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HistoryPage extends StatelessWidget {
  final String name;
  final List<Map> data;

  const HistoryPage({super.key, required this.name, required this.data});

  @override
  Widget build(BuildContext context) {
    final Map<String, String> ranges = {"": ""};
    final Map<String, String> details = {"": ""};
    final Map<String, String> title = {"": ""};

    Widget chartWidget = SfCartesianChart(
        primaryXAxis: const CategoryAxis(),
        series: <CartesianSeries>[
          LineSeries<Map, DateTime>(
              dataSource: data,
              xValueMapper: (Map item, _) => item['x'],
              yValueMapper: (Map item, _) => item['y'])
        ]);
    Widget rangeWidget = Container(
      height: 100,
      child: Column(
        children: [
          Expanded(
              child: Container(
            child: Text("بازه و محدوده شما"),
          )),
          Expanded(
              child: Container(
            child: Text(ranges[name] ?? ""),
          )),
        ],
      ),
    );
    Widget stackWidget = Stack(
      children: [
        chartWidget,
        Positioned(
          child: rangeWidget,
          bottom: 40,
        )
      ],
    );
    Widget titleText = Text(title[name] ?? "");
    Widget detailText = Text(details[name] ?? "");
    return Scaffold(
        appBar: AppBar(),
        body: Column(
      children: [stackWidget, titleText, detailText],
    ));
  }
}
