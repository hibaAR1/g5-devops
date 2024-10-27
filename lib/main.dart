import 'package:flutter/material.dart';
import 'produits_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,  // Fond blanc pour l'application
        checkboxTheme: CheckboxThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,  // AppBar blanc
          foregroundColor: Colors.black,  // Texte noir dans l'AppBar
          elevation: 0,  // Pas d'ombre
        ),
      ),
      home: const ProduitsList(),
    );
  }
}