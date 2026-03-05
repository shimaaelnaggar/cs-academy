import 'package:cs_academy/core/constants/app_colors.dart';
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

  const CustomTextFormField({
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
    super.key,
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
            cursorColor: Color(AppColors.secondaryColor),
            style: const TextStyle(
              color: Color(AppColors.secondaryColor),
              fontSize: 16,
            ),
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              hintText: hint,
              hintStyle: TextStyle(color: Color(0xff6B7280), fontSize: 16),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(AppColors.secondaryColor), width: 2),
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
