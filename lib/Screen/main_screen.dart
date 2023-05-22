import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:projekakhir/Screen/konversi_uang.dart';
import 'package:projekakhir/Screen/konversi_waktu.dart';
import 'package:projekakhir/Screen/profile.dart';
import 'package:provider/provider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../Screen/alcohol_screen.dart';
import '../Screen/categories_screen.dart';
import '../Screen/ingredients_screen.dart';
import '../provider/ingredients.dart';
import '../provider/category.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  final screen = [
    CategoriesScreen(),
    AlcoholScreen(),
    IngredientsScreen(),
    KonversiWaktu(),
    KonversiUang(),
    Profil()
  ];
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<Category>(
          create: (_) => Category(),
        ),
        ListenableProvider<Ingredients>(
          create: (_) => Ingredients(),
        )
      ],
      child: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.black,
          height: 50,
          index: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: [
            Icon(Icons.category_outlined),
            Icon(Icons.sports_bar_outlined),
            Icon(Icons.local_drink_outlined),
            Icon(Icons.schedule),
            Icon(Icons.money_outlined),
            Icon(Icons.person_outlined)
          ],
          color: Color.fromARGB(182, 0, 211, 7),
          buttonBackgroundColor: Color.fromARGB(182, 0, 211, 7),
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 300),
        ),
        body: Container(
          color: Colors.black,
          child: PageTransitionSwitcher(
            child: screen[currentIndex],
            transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
              return FadeThroughTransition(
                animation: primaryAnimation,
                secondaryAnimation: secondaryAnimation,
                child: child,
              );
            },
          ),
        ),
      ),
    );
  }
}
