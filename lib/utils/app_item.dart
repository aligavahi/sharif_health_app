import 'package:flutter/cupertino.dart';
import 'package:sharif_health_app/utils/app_colors.dart';

ImageIcon getNavigationItem(assetName, selected) {
  Color color = selected ? AppColors.white : AppColors.black;
  return ImageIcon(AssetImage(assetName), color: color);
}
