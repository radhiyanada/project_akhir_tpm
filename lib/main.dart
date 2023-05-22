import 'package:flutter/material.dart';
import 'package:projekakhir/Screen/category_screen.dart';
import 'package:projekakhir/Screen/ingredient_screen.dart';
import 'package:projekakhir/Screen/item_screen.dart';
import '../splash_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'database/shared_preference.dart';
import 'model/datamodel.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  WidgetsFlutterBinding.ensureInitialized();
  initiateLocalDB();
  SharedPreference().getLoginStatus().then((status) {
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cocktail App',
      home: SplashScreen(),
      routes: {
        ItemScreen.routeName: (_) => ItemScreen(),
        CategoryScreen.routeName: (_) => CategoryScreen(),
        IngredientScreen.routeName: (_) => IngredientScreen(),
      },
    ));
  });
  // runApp(const MyApp());
}
}


void initiateLocalDB() async {
  await Hive.initFlutter();
  Hive.registerAdapter(DataModelAdapter());
  await Hive.openBox<DataModel>("data");
}
