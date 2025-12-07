part of '../settings.dart';

class SettingSwitchRow extends StatelessWidget {
  final String title;
  final String iconPath;
  final bool value;
  final Function(bool) onChanged;

  const SettingSwitchRow({
    super.key,
    required this.title,
    required this.iconPath,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Space.vf(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(iconPath, width: 22, height: 22),
              Space.xf(12),
              Text(title, style: AppText.b1bm),
            ],
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            thumbColor: WidgetStateProperty.all(AppTheme.c.neutralWhite!),
            trackOutlineColor: WidgetStateProperty.all(
              AppTheme.c.primaryBase!.withValues(alpha: 0.3),
            ),
            inactiveTrackColor: AppTheme.c.primaryLight,
          ),
        ],
      ),
    );
  }
}
