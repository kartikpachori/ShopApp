import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/providers/auth.dart';
import 'package:shoppingapp/providers/cart.dart';
import 'package:shoppingapp/providers/orders.dart';
import 'package:shoppingapp/providers/products.dart';
import 'package:shoppingapp/screens/auth_screen.dart';
import 'package:shoppingapp/screens/cart_screen.dart';
import 'package:shoppingapp/screens/edit_product_screen.dart';
import 'package:shoppingapp/screens/orders_screen.dart';
import 'package:shoppingapp/screens/product_detail_screen.dart';
import 'package:shoppingapp/screens/products_overview_screen.dart';
import 'package:shoppingapp/screens/user_products_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Auth(),
        ),
        // ChangeNotifierProvider(
        //   create: (ctx) => Products(),
        // ),
        ChangeNotifierProxyProvider<Auth, Products>(
          create: (ctx) => Products('', '', []), // Providing just the authToken
          update: (ctx, auth, previousProducts) => Products(
              auth.token ?? '',
              auth.userId,
              previousProducts == null ? [] : previousProducts.items),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProxyProvider<Auth, Orders>(
          create: (ctx) => Orders('', '', []), // Providing just the authToken
          update: (ctx, auth, previousProducts) => Orders(
              auth.token ?? '',
              auth.userId,
              previousProducts == null ? [] : previousProducts.orders),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'EShop',
          theme: ThemeData(
            primarySwatch: Colors.lightBlue,
            fontFamily: 'Lato',
            appBarTheme: AppBarTheme(
              color: Color.fromARGB(229, 7, 106, 187),
            ),
          ),
          // Conditionally display home screen based on auth state
          home: auth.isAuth ? ProductsOverviewScreen() : AuthScreen(),
          routes: {
            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            CartScreen.routeName: (ctx) => CartScreen(),
            OrdersScreen.routeName: (ctx) => OrdersScreen(),
            UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
            EditProductScreen.routeName: (ctx) => EditProductScreen(),
            ProductsOverviewScreen.routeName: (ctx) => ProductsOverviewScreen(),
          },
        ),
      ),
    );
  }
}
