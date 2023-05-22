import 'package:flutter/material.dart';

import '../widgets/categories_grid_view.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: [
        ColorFiltered(
          colorFilter: ColorFilter.mode(Colors.black87, BlendMode.darken),
          child: Image.asset(
            "asset/image/cate.jpeg",
            fit: BoxFit.cover,
          ),
        ),
        SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Row(
                children: [
                  Text('Drink Categories',
                    textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Expanded(child: CategoriesListView()),
            ],
          ),
        ),
      ]),
    );
  }
}
