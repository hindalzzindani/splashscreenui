import 'package:flutter/material.dart';

class ArcShapes extends StatelessWidget {
  const ArcShapes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ArcPainter(),
      child: const SizedBox.expand(),
    );
  }
}

class _ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint orangePaint = Paint()..color = Colors.orange;
    Paint whitePaint = Paint()..color = Colors.white;

    Path orangePath = Path()
      ..moveTo(0, size.height * 0.8)
      ..quadraticBezierTo(size.width / 2, size.height, size.width, size.height * 0.8)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    Path whitePath = Path()
      ..moveTo(0, size.height * 0.75)
      ..quadraticBezierTo(size.width / 2, size.height * 0.9, size.width, size.height * 0.75)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(orangePath, orangePaint);
    canvas.drawPath(whitePath, whitePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
