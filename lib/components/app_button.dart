import 'package:flutter/material.dart';

class AppButton extends StatefulWidget {
  final Color? color;
  final double width;
  final double hight;
  final Border? border;
  final GestureTapCallback onTap;
  final Widget child;
  const AppButton({
    super.key,
    required this.child,
    required this.onTap,
    this.border,
    required this.width,
    required this.hight,
    this.color,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: size.width * widget.hight,
        width: size.width * widget.width,
        decoration: BoxDecoration(
          color: widget.color,
          border: widget.border,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: widget.child),
      ),
    );
  }
}
