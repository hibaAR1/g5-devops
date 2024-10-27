import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ProduitBox extends StatelessWidget {
  final String nomProduit;
  final bool selProduit;
  final Function(bool?) onChanged;
  final VoidCallback delProduit;

  const ProduitBox({
    super.key,
    required this.nomProduit,
    required this.selProduit,
    required this.onChanged,
    required this.delProduit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),  // Ajout de padding horizontal
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (_) => delProduit(),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Supprimer',
              borderRadius: BorderRadius.circular(25),  // Coins arrondis pour le bouton supprimer
            ),
          ],
        ),
        child: Container(
          height: 60,  // Hauteur augmentée
          decoration: BoxDecoration(
            color: Colors.yellow,  // Fond jaune
            borderRadius: BorderRadius.circular(25),  // Coins très arrondis
          ),
          child: Row(
            children: [
              const SizedBox(width: 8),  // Espacement au début
              Transform.scale(
                scale: 1.2,  // Checkbox un peu plus grande
                child: Checkbox(
                  value: selProduit,
                  onChanged: onChanged,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),  // Coins arrondis pour la checkbox
                  ),
                ),
              ),
              const SizedBox(width: 12),  // Espacement entre checkbox et texte
              Text(
                nomProduit,
                style: const TextStyle(
                  fontSize: 16,  // Taille de texte plus grande
                  fontWeight: FontWeight.w500,  // Texte un peu plus gras
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}