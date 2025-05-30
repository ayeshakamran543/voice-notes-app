import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noteee/configs/configs.dart';
import 'package:noteee/widgets/design/buttons/app_button/app_button.dart';

part 'widgets/_body.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return const _Body();
  }
}
