import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  final bool isSelected;

  const DotIndicator({Key? key, required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 10,
      width: isSelected ? 20 : 10,
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
