import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:noteee/configs/configs.dart';
import 'package:noteee/core/auth/auth_services.dart';
import 'package:noteee/models/app_user/app_user_model.dart';
import 'package:noteee/widgets/design/buttons/app_button/app_button.dart';

part 'widgets/_body.dart';
part 'widgets/setting_row.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return const _Body();
  }
}
