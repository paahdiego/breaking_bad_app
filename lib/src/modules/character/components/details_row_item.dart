import 'package:breaking_bad_app/src/core/core.dart';
import 'package:flutter/material.dart';

class DetailRowItem extends StatelessWidget {
  const DetailRowItem({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            title,
            style: AppTextStyles.titleMedium(context)?.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            value,
            style: AppTextStyles.titleLarge(context),
          ),
        ],
      ),
    );
  }
}
