import 'package:flutter/material.dart';

class AddProduit extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onAdd;

  const AddProduit({
    super.key,
    required this.controller,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Ajouter un produit'),
      content: TextField(
        controller: controller,
        decoration: const InputDecoration(
          labelText: 'Nom du produit',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Annuler'),
        ),
        TextButton(
          onPressed: () {
            if (controller.text.isNotEmpty) {
              onAdd(controller.text);
              Navigator.pop(context);
            }
          },
          child: const Text('Ajouter'),
        ),
      ],
    );
  }
}
