import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final ImageProvider imageProvider;
  final double? innerRadius, outerRadius;
  final Color? borderColor;
  final Widget ? action;

  const ProfileImage(
      {
        required this.imageProvider,
        this.innerRadius,
        this.outerRadius,
        this.borderColor,
        this.action});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2.0,
      shape: const CircleBorder(),
      child: CircleAvatar(
        backgroundColor: borderColor ?? Colors.white,
        radius: outerRadius ?? 80.0,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: imageProvider,
              radius: innerRadius ?? 75.0,
            ),
            Align(
              child: action,
              alignment: Alignment.bottomRight,
            )
          ],
        ),
      ),
    );
  }
}