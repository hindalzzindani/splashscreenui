import 'dart:math';

import 'package:flutter/material.dart';

class SplashScreen4 extends StatefulWidget {
  @override
  _SplashScreen4State createState() => _SplashScreen4State();
}

class _SplashScreen4State extends State<SplashScreen4> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    Future.delayed(Duration(seconds: 15), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: Center(

        child: Stack(
          alignment: Alignment.center,
          children: [
            // النقاط المحيطة
            for (int i = 0; i < 8; i++)
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  double angle = i * (3.14159 / 4); // توزيع النقاط بزاوية 45 درجة
                  double radius = 80; // نصف قطر الدائرة المحيطة
                  return Opacity(
                    opacity: _animation.value,
                    child: Transform.translate(
                      offset: Offset(
                        radius * _animation.value * cos(angle),
                        radius * _animation.value * sin(angle),
                      ),
                      child: CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.green,
                      ),
                    ),
                  );
                },
              ),
            // اللوجو في المنتصف
            Image.asset(
              'assets/images/logo.png',
              width: 100,
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}

// الصفحة الرئيسية (Home Screen) كنموذج
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('الصفحة الرئيسية')),
      body: Center(child: Text('مرحبًا بك في الصفحة الرئيسية!')),
    );
  }
}
