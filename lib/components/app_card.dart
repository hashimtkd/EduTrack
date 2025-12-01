import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final GestureLongPressCallback? onLongPress;
  final Border? border;
  final GestureTapCallback? onTap;
  final Widget child;
  final Color? color;
  final double? hight;
  final double? width;
  const AppCard({
    super.key,
    this.color,
    this.hight,
    this.width,
    required this.child,
    this.onTap,
    this.border,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      onTap: onTap,
      child: Container(
        height: hight,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          border: border,
        ),
        child: Center(child: child),
      ),
    );
  }
}
