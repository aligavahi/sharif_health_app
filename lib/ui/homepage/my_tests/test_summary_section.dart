import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharif_health_app/model/homepage/my_tests/my_tests_cubit.dart';
import 'package:sharif_health_app/ui/homepage/my_tests/fat_analysis.dart';
import 'package:sharif_health_app/ui/homepage/my_tests/general_analysis.dart';
import 'package:sharif_health_app/ui/homepage/my_tests/muscle_analysis.dart';
import 'package:sharif_health_app/utils/app_colors.dart';

class TestSummarySection extends StatefulWidget {
  const TestSummarySection({super.key, required this.data});

  final DeviceData data;

  @override
  State<TestSummarySection> createState() => _TestSummarySectionState();
}

class _TestSummarySectionState extends State<TestSummarySection>
    with TickerProviderStateMixin {
  late TabController tabController;
  final titlePrefix = "تست";
  final subtitlePrefix = "مرکز تست:";

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this,initialIndex: 1);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
          backgroundColor: AppColors.white,
          leading: InkWell(child: Icon(Icons.arrow_back),onTap: ()=>BlocProvider.of<MyTestsCubit>(context).goBack(),),
          title: ListTile(
            title: Text(
              "$titlePrefix ${widget.data.getHijriFormatDate()}",
              textDirection: TextDirection.rtl,
            ),
            subtitle: Text("$subtitlePrefix ${widget.data.center}",
                textDirection: TextDirection.rtl),
            leading: InkWell(onTap: () {}, child: const Icon(Icons.print)),
          ),
          bottom: TabBar(
            isScrollable: true,
            controller: tabController,
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 5.0),
            indicatorColor: AppColors.green,
            labelColor: AppColors.green,
            unselectedLabelColor: AppColors.black,
            indicatorWeight: 3.0,
            tabs: ['آنالیز عضلات', 'آنالیز کلی', 'آنالیز چربی'].map((e) {
              return SizedBox(
                width: MediaQuery.of(context).size.width / 5,
                child: Tab(text: e),
              );
            }).toList(),
          )),
      body: TabBarView(
        controller: tabController,
        children: [
          MuscleAnalysis(data: widget.data),
          GeneralAnalysis(data: widget.data),
          FatAnalysis(data: widget.data)
        ],
      ),
    );
  }

  get_card_item(context, Map<String, dynamic> item) {
    return Card(
      color: Colors.white,
      shadowColor: Colors.black,
      child: ListTile(
        title: Row(children: [
          Expanded(
              flex: 1,
              child: Text(
                '${item['value']} ${item['unit']}',
                textDirection: TextDirection.rtl,
              )),
          Expanded(
              flex: 1,
              child: Text(check_null(item), textDirection: TextDirection.rtl)),
          Expanded(
              flex: 2,
              child: Text(item['name'], textDirection: TextDirection.rtl)),
        ]),
        trailing: SizedBox(
          child: Image.asset(
            "assets/mytests/${item['icon']}",
          ),
        ),
      ),
    );
  }

  String check_null(Map<String, dynamic> item) {
    return item['percentage'] == '' ? "" : "${item['percentage']} %";
  }
}
