import 'package:projekakhir/Screen/item_screen.dart';
import 'package:flutter/material.dart';
import './template_card.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final String image;
  final String id;

  const ItemCard({
    this.id,
    this.image,
    this.title,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
    child: GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          ItemScreen.routeName,
          arguments: {'title': title, 'id': id, 'image': image},
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        width: MediaQuery.of(context).size.width,
        height: 250,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.6),
              offset: Offset(0.0, 10.0),
              blurRadius: 10.0,
              spreadRadius: -6.0,
            ),
          ],
          image: DecorationImage(
            image: NetworkImage(image),
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.multiply,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(children: [
          Align(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 19,
                  color: Colors.white,
                  fontWeight: FontWeight.bold, 
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            alignment: Alignment.center,
          ),
        ])
      ),
    )
    );
  }
}
