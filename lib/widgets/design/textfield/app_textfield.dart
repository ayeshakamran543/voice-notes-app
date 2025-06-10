import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:noteee/configs/configs.dart';

class AppTextField extends StatefulWidget {
  final String name;
  final TextEditingController? controller;
  final String? hint;
  final bool? isPass;

  final bool enabled;
  final double? width;
  final String? label;
  final bool autoFocus;
  final FocusNode? node;
  final bool readOnly;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? initialValue;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final String? errorText;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final void Function()? onEditComplete;
  final List<TextInputFormatter>? inputformatters;
  final void Function()? onTap;
  final int? maxLines;
  final int? minLines;
  final String? helperText;

  const AppTextField({
    super.key,
    this.node,
    this.label,
    this.controller,
    this.enabled = true,
    this.errorText,
    this.autoFocus = false,
    this.prefixIcon,
    this.onChanged,
    this.onEditComplete,
    this.initialValue,
    this.validator,
    this.suffixIcon,
    this.onTap,
    required this.name,
    this.hint,
    this.readOnly = false,
    this.isPass = false,
    this.textInputType,
    this.inputformatters,
    this.width = double.infinity,
    this.textInputAction = TextInputAction.done,
    this.textCapitalization = TextCapitalization.sentences,
    this.maxLines,
    this.minLines = 1,
    this.helperText,
  });

  @override
  AppTextFieldState createState() => AppTextFieldState();
}

class AppTextFieldState extends State<AppTextField> {
  bool show = false;
  bool isTyping = false;
  bool isFocused = false;
  late FocusNode _focusNode;
  int letterCount = 0;
  static const int maxLetters = 300;

  @override
  void initState() {
    show = widget.isPass!;
    _focusNode = widget.node ?? FocusNode();

    _focusNode.addListener(() {
      if (!_focusNode.hasFocus && isTyping) {
        setState(() {
          isFocused = true;
        });
      } else {
        setState(() {
          isFocused = false;
        });
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final textColor = AppTheme.c.neutralBlack!;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: AppText.b1bm!.cl(AppTheme.c.neutralBlack!),
          ),
          Space.yf(12),
        ],
        Stack(
          alignment: Alignment.centerRight,
          children: [
            FormBuilderTextField(
              minLines: widget.minLines,
              maxLines: widget.maxLines ?? 1,
              controller: widget.controller,
              inputFormatters: widget.inputformatters,
              style: AppText.l1!.cl(textColor),
              cursorColor: AppTheme.c.neutralBlack,
              onTap: widget.onTap,
              textCapitalization: widget.textCapitalization,
              enabled: widget.enabled,
              initialValue: widget.initialValue,
              name: widget.name,
              autofocus: widget.autoFocus,
              textInputAction: widget.textInputAction,
              keyboardType: widget.textInputType,
              focusNode: _focusNode,
              readOnly: widget.readOnly,
              obscureText: show,
              onChanged: (value) {
                setState(() {
                  isTyping = value != null && value.isNotEmpty;
                  letterCount = value?.length ?? 0;
                });
                widget.onChanged?.call(value);
              },
              onEditingComplete: () {
                setState(() {
                  isFocused = isTyping;
                });
                FocusScope.of(context).unfocus();
                widget.onEditComplete?.call();
              },
              decoration: InputDecoration(
                errorText: widget.errorText,
                prefixIcon: widget.prefixIcon,
                suffixIcon: widget.suffixIcon,
                filled: true,
                fillColor: AppTheme.c.neutralWhite,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 16.h,
                ),
                hintText: widget.hint,
                hintStyle: AppText.b2!.cl(AppTheme.c.neutralBaseGrey!),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(
                    color:
                        isTyping || isFocused
                            ? AppTheme.c.primaryBase!
                            : AppTheme.c.neutralBaseGrey!,
                    width: 1,
                  ),
                ),
                focusedBorder:
                    widget.readOnly
                        ? UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: AppTheme.c.primaryBase!,
                            width: 1,
                          ),
                        )
                        : OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(
                            color: AppTheme.c.primaryBase!,
                            width: 1,
                          ),
                        ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(
                    color: AppTheme.c.errorBase!,
                    width: 1,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2.r),
                  borderSide: BorderSide(
                    color: AppTheme.c.errorBase!,
                    width: 1,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2.r),
                  borderSide: BorderSide(
                    width: 1,
                    color: AppTheme.c.neutralLightGrey!,
                  ),
                ),
              ),
              validator: widget.validator,
            ),
          ],
        ),
        if (widget.helperText != null) ...[
          Space.yf(12),
          Text(
            widget.helperText!,
            style: AppText.l1!.cl(AppTheme.c.neutralBaseGrey!),
          ),
        ],
      ],
    );
  }
}
