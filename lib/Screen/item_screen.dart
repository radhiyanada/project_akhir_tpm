import 'package:flutter/material.dart';
import 'package:projekakhir/helpers/data_fetcher.dart';
import 'package:projekakhir/Screen/ingredient_screen.dart';

class ItemScreen extends StatelessWidget {
  static const routeName = 'item-screen';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as Map<String, dynamic>;

    final drinkInstance = DataFetcher("https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=${args['id']}");

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
            child: Image.network(
              args['image'],
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Text('Failed to load image');
              },
            ),
          ),
          FutureBuilder(
            future: drinkInstance.fetchDrinkData(),
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: double.infinity),
                    CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    ),
                    TextButton.icon(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.white
                        )
                      ),
                      icon: BackButtonIcon(),
                      label: Text('Back'),
                    ),
                  ],
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                if (!drinkInstance.dataFetched) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: double.infinity),
                      Text(
                        'An Error Occurred',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      TextButton.icon(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.white
                          ),
                        ),
                        icon: BackButtonIcon(),
                        label: Text('Back'),
                      ),
                    ],
                  );
                }
                drinkInstance.setData();
                return SafeArea(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          BackButton(
                            color: Colors.white,
                          ),
                          Expanded(
                            child: Text(
                              args['title'],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Category',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      drinkInstance.category,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'GlassType',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      drinkInstance.glass,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Alcoholic',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      drinkInstance.alcoholic == 'Alcoholic' ? "Yes" : "No",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              child: Text(
                                'Ingredients',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 200,
                              child: ListView.builder(
                                itemCount: drinkInstance.ingredients.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (ctx, i) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                        IngredientScreen.routeName,
                                        arguments: {
                                          'title': drinkInstance.ingredients[i]['name'],
                                          'image': drinkInstance.ingredients[i]['image'],
                                        },
                                      );
                                    },
                                    child: Card(
                                      color: Colors.transparent,
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: Image.network(
                                              drinkInstance.ingredients[i]['image'],
                                              fit: BoxFit.cover,
                                              errorBuilder: (context, error, stackTrace) {
                                                return Text('Failed to load image');
                                              },
                                            ),
                                          ),
                                          Text(
                                            drinkInstance.ingredients[i]['name'],
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            "Amount: ${drinkInstance.ingredients[i]['amount']}",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                              child: Text(
                                'Instructions',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              child: Text(
                                drinkInstance.desc,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.white
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
              return SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
