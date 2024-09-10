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
    final Map<String, String> ranges = {
      "weight":
          "بازه مجاز شما از ${data[0]['lower_weight']} تا ${data[0]['upper_weight']} کیلوگرم",
      "bmi":
          "بازه مجاز شما از ${data[0]['lower_bmi']} تا ${data[0]['upper_bmi']}",
      "fat_percentage":
          "بازه مجاز شما از ${data[0]['lower_fat_p']} تا ${data[0]['upper_fat_p']} درصد",
      "fat_mass":
          "بازه مجاز شما از ${data[0]['lower_fat_m']} تا ${data[0]['upper_fat_m']} کیلوگرم",
      "ffm":
          "بازه مجاز شما از ${data[0]['lower_ffm']} تا ${data[0]['upper_ffm']} کیلوگرم",
      "muscle_mass":
          "بازه مجاز شما از ${data[0]['lower_muscle_m']} تا ${data[0]['upper_muscle_m']} کیلوگرم",
      "visceral_fat_rating": "بازه مجاز: کمتر از 13",
    };

    final Map<String, String> details = {
      "weight": """
تعریف: مجموع توده چربی (Fat Mass) و توده بدون چربی (Fat Free Mass).
وزن بدن مجموع جرم تمام اجزای تشکیل دهنده بدن شامل عضلات، استخوان‌ها، اندام‌ها، مایعات بدن، چربی و سایر بافت‌ها است. این پارامتر به تنهایی نمی‌تواند نشان‌دهنده سلامت کلی باشد، اما در ترکیب با سایر شاخص‌ها می‌تواند اطلاعات مفیدی در مورد وضعیت سلامت فردی ارائه دهد.
واحد: کیلوگرم (kg)
""",
      "fat_mass": """
تعریف: شامل تمام چربی‌های بدن اعم از چربی ضروری و غیرضروری.
توده چربی شامل تمام چربی‌های ذخیره شده در بدن است. این چربی‌ها به دو دسته چربی ضروری و چربی ذخیره‌ای تقسیم می‌شوند. چربی ضروری برای عملکرد طبیعی بدن از جمله حفاظت از اندام‌ها، تنظیم دمای بدن و تولید هورمون‌ها لازم است. چربی ذخیره‌ای انرژی اضافی است که بدن برای استفاده در زمان نیاز ذخیره می‌کند. میزان مناسب چربی بدن برای عملکرد بهینه و سلامت کلی ضروری است.
واحد: کیلوگرم (kg)
""",
      "ffm": """
تعریف: شامل عضلات، استخوان‌ها، اندام‌ها، آب و مواد معدنی بدن.
توده بدون چربی شامل تمام اجزای بدن به جز چربی است. این شامل عضلات اسکلتی، اندام‌های داخلی، استخوان‌ها، مایعات بدن، بافت همبند و سایر بافت‌های غیر چربی می‌شود. FFM نقش مهمی در متابولیسم پایه بدن دارد و افزایش آن معمولاً با افزایش قدرت، استقامت و سوخت و ساز بدن همراه است.
واحد: کیلوگرم (kg)
""",
      "muscle_mass": """
تعریف: مجموع عضلات اسکلتی و غیر ارادی بدن.
توده عضلانی به کل بافت عضلانی بدن اشاره دارد. این شامل سه نوع اصلی عضله است: عضلات اسکلتی (متصل به استخوان‌ها و مسئول حرکات ارادی)، عضلات صاف (در اندام‌های داخلی و رگ‌های خونی) و عضله قلبی. توده عضلانی نقش کلیدی در قدرت، تحرک، تعادل و متابولیسم بدن دارد. افزایش توده عضلانی معمولاً با بهبود سلامت کلی، افزایش سوخت و ساز و کاهش خطر بیماری‌های مزمن همراه است.
واحد: کیلوگرم (kg)
""",
      "bone_mass": """
تعریف: نشان‌دهنده میزان مواد معدنی موجود در استخوان‌ها.
توده استخوانی به مقدار مواد معدنی (عمدتاً کلسیم و فسفر) موجود در استخوان‌های بدن اشاره دارد. این شاخص نشان‌دهنده قدرت و تراکم استخوان است. توده استخوانی بالاتر معمولاً با استخوان‌های قوی‌تر و کاهش خطر پوکی استخوان و شکستگی همراه است. عوامل مختلفی مانند ژنتیک، تغذیه، فعالیت فیزیکی و سطح هورمون‌ها بر توده استخوانی تأثیر می‌گذارند.
واحد: کیلوگرم (kg)
""",
      "bmi": """
تعریف: نسبت وزن (کیلوگرم) به مجذور قد (متر مربع).
شاخص توده بدنی (BMI) یک معیار ساده برای ارزیابی نسبت وزن به قد است که برای تخمین چربی بدن و ارزیابی وزن سلامت در جمعیت‌های بزرگ استفاده می‌شود. این شاخص از تقسیم وزن (کیلوگرم) بر مجذور قد (متر مربع) محاسبه می‌شود. اگرچه BMI ابزار مفیدی برای ارزیابی کلی است، اما محدودیت‌هایی دارد. این شاخص تفاوت بین توده عضلانی و چربی را تشخیص نمی‌دهد و ممکن است برای برخی گروه‌ها مانند ورزشکاران یا سالمندان دقیق نباشد. بنابراین، BMI باید در کنار سایر معیارها و ارزیابی‌های پزشکی مورد استفاده قرار گیرد.
واحد: کیلوگرم بر متر مربع (kg/m²)
""",
      "smm": """
تعریف: عضلات قابل کنترل ارادی که به اسکلت متصل هستند.
ماهیچه‌های اسکلتی (SMM) بزرگترین گروه عضلات بدن هستند که به استخوان‌ها متصل می‌شوند و مسئول حرکات ارادی بدن هستند. این عضلات نقش مهمی در حرکت، حفظ وضعیت بدن، تولید گرما و متابولیسم دارند. افزایش توده ماهیچه‌های اسکلتی معمولاً با افزایش قدرت، استقامت، سوخت و ساز پایه و بهبود کنترل قند خون همراه است. تمرینات مقاومتی و مصرف پروتئین کافی می‌توانند به افزایش و حفظ SMM کمک کنند.
واحد: کیلوگرم (kg)
""",
      "metabolic_age": """
تعریف: سن محاسبه شده بر اساس میزان متابولیسم بدن.
سن متابولیکی مفهومی است که سن فیزیولوژیکی بدن را بر اساس میزان متابولیسم آن در مقایسه با میانگین افراد هم‌سن و هم‌جنس تخمین می‌زند. این شاخص با مقایسه BMR (میزان سوخت و ساز پایه) فرد با میانگین میزان سوخت و ساز پایه افراد هم‌سن محاسبه می‌شود. سن متابولیکی پایین‌تر از سن تقویمی نشان‌دهنده متابولیسم سالم‌تر و احتمالاً سلامت کلی بهتر است. این شاخص می‌تواند انگیزه‌ای برای بهبود سبک زندگی و افزایش فعالیت فیزیکی باشد.
واحد: سال
""",
      "total_water_percentage": """
تعریف: مجموع آب موجود در بافت‌ها، خون و مایعات بدن.
حجم کل آب بدن به مقدار کل آب موجود در بدن اشاره دارد که شامل آب درون سلولی و برون سلولی می‌شود. آب نقش حیاتی در بسیاری از فرآیندهای بدن از جمله تنظیم دمای بدن، انتقال مواد مغذی و اکسیژن، دفع مواد زائد و حفظ حجم خون دارد. میزان حجم کل آب بدن تحت تأثیر عواملی مانند سن، جنسیت، ترکیب بدن و وضعیت هیدراتاسیون قرار می‌گیرد. حفظ تعادل آب بدن برای عملکرد بهینه تمام سیستم‌های بدن ضروری است.
واحد: درصد (%)
""",
      "bmr": """
تعریف: میزان انرژی مصرفی بدن در حالت استراحت کامل در طول 24 ساعت.
سوخت و ساز پایه (BMR) به حداقل میزان انرژی مورد نیاز بدن برای انجام عملکردهای حیاتی در حالت استراحت کامل و ناشتا اشاره دارد. این شامل انرژی لازم برای تنفس، گردش خون، عملکرد مغز و اندام‌ها، و حفظ دمای بدن می‌شود. BMR تحت تأثیر عواملی مانند سن، جنس، وزن، قد، ترکیب بدن و عوامل ژنتیکی قرار می‌گیرد و معمولاً 60-75% از کل انرژی مصرفی روزانه را تشکیل می‌دهد. افزایش توده عضلانی و فعالیت فیزیکی منظم می‌تواند به افزایش BMR کمک کند.
واحد: کیلوکالری در روز (kcal/day)
""",
      "visceral_fat_rating": """
تعریف: چربی انباشته شده اطراف اندام‌های داخلی شکم.
چربی احشایی به چربی ذخیره شده در حفره شکمی و اطراف اندام‌های داخلی مانند کبد، لوزالمعده و روده‌ها اشاره دارد. این نوع چربی، برخلاف چربی زیرپوستی، از بیرون قابل مشاهده نیست اما از نظر متابولیکی بسیار فعال است. سطوح بالای چربی احشایی با افزایش خطر ابتلا به بیماری‌های متابولیک مانند دیابت نوع 2، بیماری‌های قلبی-عروقی و برخی سرطان‌ها ارتباط دارد.
واحد: بدون واحد (مقیاس عددی)

تحلیل:
محدوده 13-18: شروع تجمع چربی احشایی، نیاز به اصلاح سبک زندگی
بیشتر از 18: خطر بالای بیماری‌های قلبی-عروقی، دیابت و سرطان
""",
    };

    final Map<String, String> title = {
      "weight": "وزن بدن چیست؟",
      "fat_mass": "توده چربی چیست؟",
      "ffm": "توده بدون چربی چیست؟",
      "muscle_mass": "توده عضلانی چیست؟",
      "bone_mass": "توده استخوانی چیست؟",
      "bmi": "شاخص توده بدنی چیست؟",
      "smm": "ماهیچه‌های اسکلتی چیست؟",
      "metabolic_age": "سن متابولیکی چیست؟",
      "total_water_percentage": "حجم کل آب بدن چیست؟",
      "bmr": "سوخت و ساز پایه چیست؟",
      "visceral_fat_rating": "چربی احشایی چیست؟",
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
