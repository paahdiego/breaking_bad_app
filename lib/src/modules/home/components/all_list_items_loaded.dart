import 'package:flutter/material.dart';

class AllListItemsLoaded extends StatelessWidget {
  const AllListItemsLoaded({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: const Center(
        child: Text("Todos os itens carregados."),
      ),
    );
  }
}
