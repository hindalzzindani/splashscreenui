import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // للتحكم في الحالة الأولية للحركة
  bool isCentered = false;

  @override
  void initState() {
    super.initState();
    // بدء الحركة عند تحميل الشاشة
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        isCentered = true; // تغيير الحالة لتفعيل الحركة
      });
    });

    // الانتقال إلى الصفحة الرئيسية بعد 16 ثوانٍ
    Future.delayed(Duration(seconds: 16), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              // الجزء الأيمن
              AnimatedContainer(
                duration: Duration(seconds: 3), // مدة الحركة
                curve: Curves.easeInOut,
                width: isCentered
                    ? MediaQuery.of(context).size.width / 2 // نصف العرض في الوسط
                    : MediaQuery.of(context).size.width, // العرض الكامل عند البداية
                color: Colors.grey,
              ),
              // الجزء الأيسر
              AnimatedContainer(
                duration: Duration(seconds: 3), // مدة الحركة
                curve: Curves.easeInOut,
                width: isCentered
                    ? MediaQuery.of(context).size.width / 2 // نصف العرض في الوسط
                    : 0, // العرض صفر عند البداية
                color: Colors.green[800],
              ),
            ],
          ),
          // المحتوى في المنتصف
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // صورة متحركة من Lottie عبر رابط
                Lottie.network(
                  'https://lottie.host/c8e33bd0-7d97-46a0-b762-47aa6766fce7/P5kTXV09Cd.json',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 20), // مسافة بين الصورة والنص
                // النص
                Text(
                  'هلا موني',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// الصفحة الرئيسية (Home Screen) كنموذج
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(child: Text('مرحبًا بك في الصفحة الرئيسية!')),
    );
  }
}
