import 'package:flutter/material.dart';
import 'package:shoppingapp/screens/cart_screen.dart';
import 'package:shoppingapp/screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './providers/products.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
import './providers/cart.dart';
import './providers/orders.dart';
import './screens/orders_screen.dart';
import './screens/user_products_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          fontFamily: 'Lato',
          appBarTheme: AppBarTheme(
            color: Color.fromARGB(229, 7, 106, 187),
          ),
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrdersScreen.routename: (ctx) => OrdersScreen(),
          UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
        },
      ),
    );
  }
}
