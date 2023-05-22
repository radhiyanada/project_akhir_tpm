import 'package:flutter/material.dart';
import 'package:projekakhir/helpers/main_data_fetcher.dart';
import "package:projekakhir/Screen/items_screen.dart";

class IngredientScreen extends StatelessWidget {
  static const routeName = 'Ingredient-Screen';
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    return ItemsScreen(
      future: MainDataFetcher.fetchIngredientsDrinkData,
      title: args['title'],
      image: args['image'],
    );
  }
}
