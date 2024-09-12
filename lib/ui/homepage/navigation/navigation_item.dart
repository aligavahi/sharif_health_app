import 'package:flutter/cupertino.dart';
import 'package:sharif_health_app/utils/app_colors.dart';

class NavigationItem extends StatelessWidget {
  final String assetName;
  final String label;
  final bool isActive;
  final double activeSize = 50;
  final double inActiveSize = 60;

  const NavigationItem(
      {super.key,
      required this.assetName,
      required this.label,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    final Widget icon = getNavigationItem(assetName);
    Widget widget;
    if (!isActive) {
      widget = Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Expanded(flex: 2  ,child: Center(child: icon)),
            Center(
                child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ))
          ]);
    } else {
      widget = Center(child: icon);
    }
    return SizedBox(height: isActive ? activeSize : inActiveSize, child: widget);
  }

  Widget getNavigationItem(assetName) {
    Color color = isActive ? AppColors.white : AppColors.black;
    return Image.asset(assetName, color: color,fit: BoxFit.scaleDown,);
  }
}
