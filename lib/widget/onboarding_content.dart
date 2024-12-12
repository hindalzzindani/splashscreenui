import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'onboarding_model.dart';

class OnboardingContent extends StatelessWidget {
  final OnboardingModel tab;

  const OnboardingContent({Key? key, required this.tab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Lottie.asset(tab.lottieFile)),
          const SizedBox(height: 20),
          Text(
            tab.title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            tab.subtitle,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
