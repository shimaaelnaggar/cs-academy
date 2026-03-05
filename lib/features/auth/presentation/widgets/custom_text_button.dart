import 'package:cs_academy/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.buttonText,
  });

  final String text;
  final VoidCallback onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: TextStyle(color: Color(0xff64748B), fontSize: 14)),
        SizedBox(width: 5),
        TextButton(
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 14,
              color: Color(AppColors.secondaryColor),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
