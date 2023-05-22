import 'package:flutter/material.dart';
import 'package:projekakhir/Screen/items_screen.dart';
import 'package:projekakhir/helpers/main_data_fetcher.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key key}) : super(key: key);

  static const routeName = 'CategoryScreen';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    return ItemsScreen(
        future: MainDataFetcher.fetchCategoryDrinkData,
        image: args['image'],
        title: args['title']);
  }
}