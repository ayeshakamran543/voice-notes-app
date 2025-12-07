part of '../settings.dart';

void _showFontSizeSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
    ),
    builder: (_) {
      return Consumer<FontSizeProvider>(
        builder: (context, fontProvider, _) {
          return Padding(
            padding: Space.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Space.yf(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Select Font Size', style: AppText.h3b),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: CircleAvatar(
                        radius: 16.r,
                        backgroundColor: AppTheme.c.primaryLight,
                        child: Icon(Icons.close, color: AppTheme.c.primaryBase),
                      ),
                    ),
                  ],
                ),
                Space.yf(16),
                Container(height: 1.h, color: AppTheme.c.neutralBaseGrey),
                Space.yf(24),
                _fontOption(context, fontProvider, 'Small'),
                _fontOption(context, fontProvider, 'Medium'),
                _fontOption(context, fontProvider, 'Large'),
              ],
            ),
          );
        },
      );
    },
  );
}

Widget _fontOption(
  BuildContext context,
  FontSizeProvider provider,
  String size,
) {
  return ListTile(
    title: Text(size, style: AppText.b1bm),
    trailing:
        provider.fontSize == size
            ? Icon(Icons.check, color: AppTheme.c.primaryBase)
            : null,
    onTap: () {
      provider.setFontSize(size);
      Navigator.pop(context);
    },
  );
}
