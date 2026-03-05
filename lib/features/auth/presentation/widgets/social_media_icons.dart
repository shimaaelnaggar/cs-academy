import 'package:cs_academy/core/constants/app_colors.dart';
import 'package:cs_academy/core/constants/app_icons.dart';
import 'package:flutter/material.dart';

class SocialMediaIcons extends StatelessWidget {
  const SocialMediaIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Divider(
                color: AppColors.dividerColor,
                thickness: 1,
                endIndent: 10,
              ),
            ),
            Text(
              'or continue with',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Divider(
                color: AppColors.dividerColor,
                thickness: 1,
                indent: 10,
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: AppIcons.google.isNotEmpty
                  ? Image.asset(AppIcons.google)
                  : Icon(Icons.error),
            ),
            SizedBox(width: 20),
            IconButton(
              onPressed: () {},
              icon: AppIcons.facebook.isNotEmpty
                  ? Image.asset(AppIcons.facebook)
                  : Icon(Icons.error),
            ),
            SizedBox(width: 20),
            IconButton(
              onPressed: () {},
              icon: AppIcons.apple.isNotEmpty
                  ? Image.asset(AppIcons.apple)
                  : Icon(Icons.error),
            ),
          ],
        ),
      ],
    );
  }
}
