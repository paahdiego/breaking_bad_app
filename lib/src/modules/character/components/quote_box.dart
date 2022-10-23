import 'package:breaking_bad_app/src/core/core.dart';
import 'package:breaking_bad_app/src/modules/character/components/details_row_item.dart';
import 'package:breaking_bad_app/src/shared/components/shimmer_effect/shimmed_box.dart';
import 'package:flutter/material.dart';

class QuoteBox extends StatelessWidget {
  const QuoteBox({
    Key? key,
    this.quote,
    this.author,
  }) : super(key: key);
  final String? quote;
  final String? author;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShimmedBox(
          isLoading: !(quote != null) && !(author != null),
          child: Text(
            quote != null ? "\"${quote!}\"" : "",
            style: AppTextStyles.titleSmall(context)?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        ShimmedBox(
          isLoading: !(quote != null) && !(author != null),
          child: DetailRowItem(
            title: "Autor/Autora: ",
            value: author != null ? author! : "",
          ),
        ),
      ],
    );
  }
}
