import 'package:flutter/material.dart';
import 'package:shoppingapp/screens/product_detail_screen.dart';
import 'package:shoppingapp/screens/products_overview_screen.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';

class ProductItem extends StatelessWidget {
  //final String id;
  //final String title;
  //final String imageUrl;

  //ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
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
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                arguments: product.id);
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: GridTileBar(
            backgroundColor: Colors.black87,
            leading: IconButton(
              icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border),
              onPressed: () {
                product.toggleFavoriteStatus();
              },
              color: Theme.of(context).accentColor,
            ),
            title: Text(
              product.title,
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
