import 'package:cs_academy/core/constants/app_colors.dart';
import 'package:cs_academy/core/routing/routes.dart';
import 'package:cs_academy/core/theme/text_styles.dart';
import 'package:cs_academy/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CustomCouseCard extends StatelessWidget {
  const CustomCouseCard({
    super.key,
    required this.desc,
    required this.imag,
    required this.price,
    required this.title,
    required this.arguments,
  });

  final String title;
  final String imag;
  final String desc;
  final num price;
  final Object? arguments;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Color(AppColors.primaryColor),
      color: Color(AppColors.primaryColor),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  imag,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(child: Icon(Icons.broken_image));
                  },
                ),
              ),
            ),

            const SizedBox(height: 8),

            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.s14bold,
            ),

            const SizedBox(height: 4),

            Text(
              '$price USD',
              style: AppTextStyles.s14bold.copyWith(
                fontSize: 12,
                color: const Color(0xff4B5563),
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 40,
              child: CustomButton(onPressed: () {
                Navigator.pushNamed(context,Routes.courseDetails,arguments: arguments);
              }, text: "Details"),
            ),
          ],
        ),
      ),
    );
  }
}
