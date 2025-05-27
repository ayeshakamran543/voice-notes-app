part of 'configs.dart';

class AppText {
  static TextStyle? btn;

  // Headings
  static TextStyle? h;
  static TextStyle? hb;
  static TextStyle? hbm;
  static TextStyle? h1;
  static TextStyle? h1b;
  static TextStyle? h1bm;
  static TextStyle? h2;
  static TextStyle? h2b;
  static TextStyle? h2bm;
  static TextStyle? h3;
  static TextStyle? h3b;
  static TextStyle? h3bm;

  // Body
  static TextStyle? b1;
  static TextStyle? b1b;
  static TextStyle? b1bm;
  static TextStyle? b2;
  static TextStyle? b2b;
  static TextStyle? b2bm;

  // Label
  static TextStyle? l1;
  static TextStyle? l1b;
  static TextStyle? l1bm;
  static TextStyle? l2;
  static TextStyle? l2b;
  static TextStyle? l2bm;

  static init(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 780));
    const b = FontWeight.bold;
    TextStyle baseStyle = const TextStyle(fontFamily: fontFamily);

    // text-3xl (40px, 110%)
    h = baseStyle.copyWith(fontSize: 40.h, height: 1.1);
    hb = h!.copyWith(fontWeight: b);
    hbm = h!.copyWith(fontWeight: FontWeight.w500);

    // text-2xl (32px, 120%)
    h1 = baseStyle.copyWith(fontSize: 32.h, height: 1.2);
    h1b = h1!.copyWith(fontWeight: b);
    h1bm = h1!.copyWith(fontWeight: FontWeight.w500);

    // text-xl (24px, 120%)
    h2 = baseStyle.copyWith(fontSize: 24.h, height: 1.2);
    h2b = h2!.copyWith(fontWeight: b);
    h2bm = h2!.copyWith(fontWeight: FontWeight.w500);

    // text-lg (20px, 140%)
    h3 = baseStyle.copyWith(fontSize: 20.h, height: 1.4);
    h3b = h3!.copyWith(fontWeight: b);
    h3bm = h3!.copyWith(fontWeight: FontWeight.w500);

    // text-base (16px, 140%)
    b1 = baseStyle.copyWith(fontSize: 16.h, height: 1.4);
    b1b = b1!.copyWith(fontWeight: b);
    b1bm = b1!.copyWith(fontWeight: FontWeight.w500);

    // text-sm (14px, 140%)
    b2 = baseStyle.copyWith(fontSize: 14.h, height: 1.4);
    b2b = b2!.copyWith(fontWeight: b);
    b2bm = b2!.copyWith(fontWeight: FontWeight.w500);

    // text-2xs (12px, auto)
    l1 = baseStyle.copyWith(fontSize: 12.h);
    l1b = l1!.copyWith(fontWeight: b);
    l1bm = l1!.copyWith(fontWeight: FontWeight.w500);

    // text-xs (10px, auto)
    l2 = baseStyle.copyWith(fontSize: 10.h);
    l2b = l2!.copyWith(fontWeight: b);
    l2bm = l2!.copyWith(fontWeight: FontWeight.w500);
  }
}
