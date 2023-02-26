import 'dart:math';

import 'package:flutter/material.dart';

class AppLoader  extends StatefulWidget {
  const AppLoader({
    Key ? key,
    this.foregroundColor,
    this.lineWidth = 5.0,
    this.size = 50.0,
    this.duration = const Duration(milliseconds: 1200),
    this.backgroundColor = Colors.white,
  })  :
        assert(backgroundColor != null),
        assert(lineWidth != null),
        assert(size != null),
        super(key: key);

  final Color? foregroundColor;
  final Color backgroundColor;
  final double size;
  final double lineWidth;
  final Duration duration;

  @override
  _AppLoaderState createState() => _AppLoaderState();
}

class _AppLoaderState extends State<AppLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation1, _animation2, _animation3;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation1 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 1.0, curve: Curves.linear),
      ),
    )..addListener(() => setState(() => <String, void>{}));

    _animation2 = Tween(begin: -2 / 3, end: 1 / 2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0, curve: Curves.linear),
      ),
    )..addListener(() => setState(() => <String, void>{}));

    _animation3 = Tween(begin: 0.25, end: 5 / 6).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 1.0, curve: _MyCurve()),
      ),
    )..addListener(() => setState(() => <String, void>{}));

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Matrix4 transform = Matrix4.identity()
      ..rotateZ((_animation1.value) * 5 * pi / 6);
    return Center(
      child: Transform(
        transform: transform,
        alignment: FractionalOffset.center,
        child: SizedBox.fromSize(
          size: Size.square(widget.size),
          child: CustomPaint(
            foregroundPainter: RingPainter(
              paintWidth: widget.lineWidth,
              trackColor: widget.foregroundColor??Colors.blueAccent,
              progressPercent: _animation3.value,
              startAngle: pi * _animation2.value,
            ),
            child: CustomPaint(
              foregroundPainter: CirclePainter(
                  lineColor: widget.backgroundColor,
                  width: widget.lineWidth
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RingPainter extends CustomPainter {
  RingPainter({
    this.paintWidth,
    this.progressPercent,
    this.startAngle,
    required this.trackColor,
  }) : trackPaint = Paint()
    ..color = trackColor
    ..style = PaintingStyle.stroke
    ..strokeWidth = paintWidth ?? 1.0
    ..strokeCap = StrokeCap.square;

  final double ? paintWidth;
  final Paint ? trackPaint;
  final Color  trackColor;
  final double ? progressPercent;
  final double ?startAngle;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (min(size.width, size.height) - paintWidth!) / 2;

    final progressAngle = 2 * pi * progressPercent!;

    canvas.drawArc(
      Rect.fromCircle(
        center: center,
        radius: radius,
      ),
      startAngle!,
      progressAngle,
      false,
      trackPaint!,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class CirclePainter extends CustomPainter{
  Color lineColor;

  double width;
  CirclePainter({required this.lineColor,required this.width});
  @override
  void paint(Canvas canvas, Size size) {
    Paint line = new Paint()
      ..color = lineColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = (min(size.width, size.height) - width) / 2;
    canvas.drawCircle(
        center,
        radius,
        line
    );

  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class _MyCurve extends Curve {
  const _MyCurve();

  @override
  double transform(double t) {
    if (t <= 0.5) {
      return 2 * t;
    } else {
      return 2 * (1 - t);
    }
  }
}