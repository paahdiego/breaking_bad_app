import 'package:breaking_bad_app/src/core/core.dart';
import 'package:flutter/material.dart';

class ModalHeader extends StatelessWidget {
  const ModalHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(32),
              ),
              color: AppColors.primary,
            ),
            width: 32,
            height: 8,
          ),
          const Divider(
            height: 0.0,
            thickness: 2.0,
            color: AppColors.primary,
          ),
        ],
      ),
    );
  }
}
