import 'package:flutter/material.dart';

class SplashScreenMoving extends StatefulWidget {
  @override
  _SplashScreenMovingState createState() => _SplashScreenMovingState();
}

class _SplashScreenMovingState extends State<SplashScreenMoving>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _positionAnimation;

  @override
  void initState() {
    super.initState();

    // إعداد AnimationController
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // إعداد تأثير الحجم
    _scaleAnimation = Tween<double>(begin: 1.0, end: 3.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // إعداد تأثير الانتقال
    _positionAnimation = Tween<Offset>(
      begin: Offset(0.0, -2.0), // تبدأ من الأعلى
      end: Offset(0.0, 0.0), // تصل إلى المركز
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // بدء الأنيميشن
    _controller.forward();

    // الانتقال إلى الصفحة الرئيسية بعد الانتهاء
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
      backgroundColor: Colors.white, // لون الخلفية
      body: Stack(

        children: [
          Center(
            child: SlideTransition(
              position: _positionAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Image.asset(
                  'assets/images/logo.png', // ضع صورة في مجلد assets
                  width: 50, // عرض الصورة
                  height: 50, // ارتفاع الصورة
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// الصفحة الرئيسية (Home Screen)
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('مرحبًا بك في الصفحة الرئيسية!')),
    );
  }
}
