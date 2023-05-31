// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

class SliderDot extends StatelessWidget {
  SliderDot({super.key, required this.isActive});
  bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: isActive ? 12 : 5,
      height: 5,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white38,
        borderRadius: BorderRadius.circular(6),
      ), duration: const Duration(microseconds: 150),
    );
  }
}
