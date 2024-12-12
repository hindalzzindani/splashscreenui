class OnboardingModel {
  final String lottieFile;
  final String title;
  final String subtitle;

  OnboardingModel(this.lottieFile, this.title, this.subtitle);
}

final List<OnboardingModel> tabs = [
  OnboardingModel('assets/quran.json', 'Quran Is Our Life', 'Experience true spirituality.'),
  OnboardingModel('assets/quran3.json', 'Methodology for Living', 'Learn the divine guidance.'),
  OnboardingModel('assets/quran2.json', 'Experience Joy', 'Enjoy memorizing the Quran.'),
];
