import 'package:breaking_bad_app/src/core/core.dart';
import 'package:flutter/material.dart';

class NoItemsFound extends StatelessWidget {
  const NoItemsFound({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Personagens não encontrados",
          textAlign: TextAlign.center,
          style: AppTextStyles.headline6(context),
        ),
        const SizedBox(height: 20),
        Text(
          "Tentar novamente",
          style: AppTextStyles.bodyText2(context),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
