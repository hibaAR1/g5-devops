import 'package:flutter/material.dart';
import 'AddProduit.dart';
import 'produit_box.dart';

class ProduitsList extends StatefulWidget {
  const ProduitsList({super.key});

  @override
  State<ProduitsList> createState() => _ProduitsListState();
}

class _ProduitsListState extends State<ProduitsList> {
  final List<String> _produits = [];
  final Map<String, bool> _selections = {};
  final TextEditingController _controller = TextEditingController();

  void _onChanged(String produit, bool? value) {
    setState(() {
      _selections[produit] = value ?? false;
    });
  }

  void _delProduit(String produit) {
    setState(() {
      _produits.remove(produit);
      _selections.remove(produit);
    });
  }

  void _deleteSelectedProducts() {
    setState(() {
      _produits.removeWhere((produit) => _selections[produit] ?? false);
      _selections.removeWhere((key, value) => value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des Produits'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: _deleteSelectedProducts,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AddProduit(
              controller: _controller,
              onAdd: (String newProduit) {
                setState(() {
                  _produits.add(newProduit);
                  _selections[newProduit] = false;
                });
              },
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: _produits.length,
        itemBuilder: (context, index) {
          final produit = _produits[index];
          return ProduitBox(
            nomProduit: produit,
            selProduit: _selections[produit] ?? false,
            onChanged: (value) => _onChanged(produit, value),
            delProduit: () => _delProduit(produit),
          );
        },
      ),
    );
  }
}