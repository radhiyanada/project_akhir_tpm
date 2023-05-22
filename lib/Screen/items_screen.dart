import 'package:flutter/material.dart';

import '../widgets/item_card.dart';

class ItemsScreen extends StatelessWidget {
  final Function future;
  final String title;
  final String image;

  const ItemsScreen({
    this.future, 
    this.title, 
    this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(Colors.black87, BlendMode.darken),
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    BackButton(
                      color: Colors.white,
                    ),
                    Expanded(
                      child: Text(title,
                        textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: FutureBuilder(
                    future: future(title),
                    builder: (ctx, snapshot) {
                      if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                              child: CircularProgressIndicator(
                            backgroundColor: Colors.white,
                          ));
                        } else {
                          final data = snapshot.data;
                          return ListView.builder(
                            itemBuilder: (ctx, i) {
                              var current = data[i];
                              return ItemCard(
                                id: current['idDrink'],
                                image: current["strDrinkThumb"],
                                title: current["strDrink"],
                              );
                            },
                            itemCount: data?.length ?? 0,
                          );
                        }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
