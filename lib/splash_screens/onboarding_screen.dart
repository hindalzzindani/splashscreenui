import 'package:flutter/material.dart';
import '../widget/arc_shapes.dart';
import '../widget/dot_indicator.dart';
import '../widget/gradient_background.dart';
import '../widget/onboarding_content.dart';
import '../widget/onboarding_model.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  void _handleNext() {
    if (_currentIndex == tabs.length - 1) {
      _pageController.jumpToPage(0);
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const GradientBackground(),
          const ArcShapes(),
          PageView.builder(
            controller: _pageController,
            itemCount: tabs.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return OnboardingContent(tab: tabs[index]);
            },
          ),
          // DotIndicator في منتصف الشاشة مع إنزاله للأسفل
          Positioned(
            top: MediaQuery.of(context).size.height * 0.75, // إنزال النقاط قليلاً
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                tabs.length,
                    (index) => DotIndicator(isSelected: index == _currentIndex),
              ),
            ),
          ),
          // FloatingActionButton في الزاوية اليمنى السفلى
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: _handleNext,
              child: const Icon(Icons.arrow_forward),
            ),
          ),
        ],
      ),
    );
  }
}
