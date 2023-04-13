import 'package:flutter/material.dart';
import 'package:shoppingapp/screens/products_overview_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'MyShop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          color: Color.fromARGB(255, 250, 71, 71),
        ),
      ),
      home: ProductsOverviewScreen(),
    );
  }
}
