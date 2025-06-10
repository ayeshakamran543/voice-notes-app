part of '../settings.dart';

enum RowType { navigation, action }

class SettingRow extends StatelessWidget {
  final String title;
  final RowType type;
  final String? trailingText;
  final String iconPath;
  final VoidCallback? onTap;
  const SettingRow({
    super.key,
    required this.title,
    required this.type,
    this.trailingText,
    required this.iconPath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Space.all(8, 16),
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.translucent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(iconPath, width: 24.w, height: 24.h),
            Space.xf(12),
            Text(title, style: AppText.b1bm),
            Space.xm!,
            if (type == RowType.navigation)
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16.sp,
                color: AppTheme.c.neutralDarkGrey,
              )
            else if (type == RowType.action)
              Text(
                trailingText ?? '',
                style: AppText.l1!.cl(AppTheme.c.neutralDarkGrey!),
              ),
          ],
        ),
      ),
    );
  }
}
