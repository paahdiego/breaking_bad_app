import 'package:breaking_bad_app/src/shared/components/app_loading_icon.dart';
import 'package:flutter/material.dart';

class ListLoadingIcon extends StatelessWidget {
  const ListLoadingIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: AppLoadingIcon());
  }
}
