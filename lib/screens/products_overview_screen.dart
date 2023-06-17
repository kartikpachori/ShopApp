import 'package:flutter/material.dart' hide Badge;

//import '../models/product.dart';
import '../widgets/products_grid.dart';
import '../widgets/badge.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';
import 'cart_screen.dart';
//import '../widgets/product_item.dart';

//import '../widgets/products_grid.dart';
enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'E Shop',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
                print(selectedValue);
              });
            },
            icon: Icon(
              Icons.more_vert,
              color: Color.fromARGB(183, 255, 255, 255),
            ),
            itemBuilder: (_) => [
              PopupMenuItem(
                  child: Text('Only Favorites'),
                  value: FilterOptions.Favorites),
              PopupMenuItem(child: Text('Show All'), value: FilterOptions.All),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Color.fromARGB(183, 255, 255, 255),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
              ),
              value: cart.itemCount.toString(),
            ),
          ),
        ],
      ),
      body: ProductsGrid(_showOnlyFavorites),
      //body: ProductsGrid(),
    );
  }
}
