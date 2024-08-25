import 'package:flutter/cupertino.dart';

class NavigationItem extends StatelessWidget {
  final ImageIcon icon;

  final String label;
  final bool isActive;

  const NavigationItem({super.key,
    required this.icon,
    required this.label,
    required this.isActive});

  @override
  Widget build(BuildContext context) {
    Widget widget;
    if (!isActive) {
      widget = Column(children: [
        Center(child: icon),
        Center(
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ))
      ]);
    } else {
      widget = Center(child: icon);
    }
    return SizedBox(height: 50, child: widget);
  }
}
