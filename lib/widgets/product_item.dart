import 'package:flutter/material.dart';
import 'package:shoppingapp/screens/products_overview_screen.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[800], // set the background color
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 20,
            offset: Offset(1, 5), // set the drop shadow offset
          ),
        ],
      ),
      child: GridTile(
        child: Container(
          color: Colors.black,
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: GridTileBar(
            backgroundColor: Colors.black87,
            leading: IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {},
              color: Theme.of(context).accentColor,
            ),
            title: Text(
              title,
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
      ),
    );
  }
}
