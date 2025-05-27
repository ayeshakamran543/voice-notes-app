import 'package:flutter/material.dart';
import 'package:noteee/configs/configs.dart';

part 'widgets/_body.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return const _Body();
  }
}
