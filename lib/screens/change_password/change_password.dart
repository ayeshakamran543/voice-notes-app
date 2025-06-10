import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noteee/configs/configs.dart';
import 'package:noteee/widgets/design/buttons/app_button/app_button.dart';
import 'package:noteee/widgets/design/textfield/app_textfield.dart';
import 'package:provider/provider.dart';

part 'widgets/_body.dart';
part '_state.dart';
// part 'static/_form_data.dart';
// part 'static/_form_keys.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}
