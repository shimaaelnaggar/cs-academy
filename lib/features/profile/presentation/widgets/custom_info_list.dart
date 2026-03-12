import 'package:cs_academy/core/constants/app_colors.dart';
import 'package:cs_academy/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class CustomInfoList extends StatelessWidget {
  const CustomInfoList({
    super.key,
    required this.icon,
    required this.text,
    this.onTap,
  });
  final IconData icon;
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 32,
        height: 32,
        
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(4),color: AppColors.lightBlueColor),
        child: Center(child: Icon(icon,color: AppColors.icnosColor,size: 16,)),
      ),
      title: Text(text, style: AppTextStyles.s16Meduim),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Color(0xff94A3B8),
      ),
      onTap: onTap,
    );
  }
}
