import 'package:cs_academy/core/constants/app_colors.dart';
import 'package:cs_academy/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final String? label;
  final String hint;
  final bool obscureText;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextStyle? hintStyle;
  final Color? cursorColor;
  final Color? inputColor;
  final bool filledColor;

  const CustomTextFormField({
    super.key,
    this.suffixIcon,
    this.controller,
    this.validator,
    this.prefixIcon,
    this.onChanged,
    this.textInputAction,
    this.keyboardType,
    this.inputFormatters,
    this.onSaved,
    this.label,
    required this.hint,
    this.obscureText = false,
    this.hintStyle,
    this.cursorColor,
    this.inputColor,
    this.filledColor = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),
          TextFormField(
            controller: controller,
            inputFormatters: inputFormatters,
            onChanged: onChanged,
            onSaved: onSaved,
            obscureText: obscureText,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            autocorrect: true,
            cursorColor: cursorColor ?? Color(AppColors.secondaryColor),
            style: TextStyle(
              color: inputColor ?? Color(AppColors.secondaryColor),
              fontSize: 16,
            ),
            decoration: InputDecoration(
              filled: filledColor,
              fillColor: Color(0xffF9FAFB),
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              hintText: hint,
              hintStyle: hintStyle ?? AppTextStyles.hintStyle,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(AppColors.secondaryColor),
                  width: 2,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Color(0xffD1D5DB), width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Color(0xffD1D5DB), width: 1),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(AppColors.errorColor),
                  width: 2,
                ),
              ),
            ),
            validator: validator,
          ),
        ],
      ),
    );
  }
}
