import 'package:flutter/material.dart';

import '../widgets/alcohol_list_view.dart';

class AlcoholScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(Colors.black87, BlendMode.darken),
            child: Image.asset(
              "asset/image/alco.jpeg",
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                 SizedBox(height: 10),
                Row(
                  children: [
                    Text('Alcoholic Drinks',
                      textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                 SizedBox(height: 10),
                Expanded(
                  child: AlcoholListView(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
