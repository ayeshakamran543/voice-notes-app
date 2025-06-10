import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:noteee/configs/configs.dart';

part 'enums.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final bool isDisabled;
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final Color? textColor;
  final TextStyle? textStyle;
  final ButtonType? buttonType;
  final String? iconPath;
  final Color? borderColor;

  const AppButton({
    required this.label,
    required this.onPressed,
    this.height,
    this.width,
    this.backgroundColor,
    this.textStyle,
    this.buttonType = ButtonType.primary,
    this.isDisabled = false,
    super.key,
    this.textColor,
    this.iconPath,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return GestureDetector(
      onTap: isDisabled ? () {} : onPressed,
      child: AnimatedContainer(
        duration: 200.milliseconds,
        width: width ?? double.infinity,
        height: height,
        decoration: BoxDecoration(
          border:
              buttonType == ButtonType.outlineIcon
                  ? Border.all(
                    color: borderColor ?? AppTheme.c.neutralBaseGrey!,
                    width: 1.w,
                  )
                  : null,
          borderRadius: UIProps.buttonRadius,
          color:
              isDisabled
                  ? const Color(0xFF7d7c7c)
                  : buttonType == ButtonType.secondary
                  ? AppTheme.c.neutralWhite
                  : buttonType == ButtonType.outlineIcon
                  ? backgroundColor ?? AppTheme.c.neutralWhite
                  : backgroundColor ?? AppTheme.c.primaryBase,
        ),
        padding:
            buttonType == ButtonType.outlineIcon ? Space.vf(15) : Space.vf(16),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconPath != null && buttonType == ButtonType.outlineIcon) ...[
              SvgPicture.asset(iconPath!, width: 18.w, height: 18.h),
              Space.xf(8),
            ],

            Text(
              label,
              style:
                  textStyle ??
                  AppText.b1bm!.cl(
                    buttonType == ButtonType.secondary
                        ? AppTheme.c.primaryBase!
                        : buttonType == ButtonType.outlineIcon
                        ? textColor ?? AppTheme.c.neutralBlack!
                        : textColor ?? AppTheme.c.neutralWhite!,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
