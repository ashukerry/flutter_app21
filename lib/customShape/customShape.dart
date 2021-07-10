import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Colors.blue.shade900
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.0012500, size.height * 0.0115385);
    path_0.cubicTo(size.width * 0.0012500, size.height * 0.7442308, 0,
        size.height * 0.6250000, 0, size.height * 0.8692308);
    path_0.cubicTo(
        size.width * 0.0443750,
        size.height * 0.8778846,
        size.width * 0.1793750,
        size.height * 0.7913462,
        size.width * 0.2187500,
        size.height * 0.8923077);
    path_0.cubicTo(
        size.width * 0.2500000,
        size.height * 0.9500000,
        size.width * 0.2825000,
        size.height * 0.9557692,
        size.width * 0.3037500,
        size.height * 0.9769231);
    path_0.cubicTo(
        size.width * 0.3484375,
        size.height * 0.9875000,
        size.width * 0.4453125,
        size.height * 1.0125000,
        size.width * 0.4937500,
        size.height * 0.9769231);
    path_0.cubicTo(
        size.width * 0.5253125,
        size.height * 0.9644231,
        size.width * 0.5850000,
        size.height * 0.9288462,
        size.width * 0.6112500,
        size.height * 0.9000000);
    path_0.cubicTo(
        size.width * 0.6425000,
        size.height * 0.8903846,
        size.width * 0.7146875,
        size.height * 0.8192308,
        size.width * 0.7600000,
        size.height * 0.7923077);
    path_0.cubicTo(
        size.width * 0.7846875,
        size.height * 0.7884615,
        size.width * 0.9615625,
        size.height * 0.5961538,
        size.width * 0.9987500,
        size.height * 0.8923077);
    path_0.quadraticBezierTo(size.width * 0.9996875, size.height * 0.6509615,
        size.width * 0.9975000, size.height * 0.0153846);
    path_0.quadraticBezierTo(size.width * 0.7484375, size.height * 0.0144231,
        size.width * 0.0012500, size.height * 0.0115385);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
