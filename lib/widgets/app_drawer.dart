import 'package:flutter/material.dart';
import 'package:shoppingapp/screens/user_products_screen.dart';
import '../screens/orders_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text(' Hello Friend! '),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.shop,
              color: Color.fromARGB(255, 3, 31, 88),
            ),
            title: Text(
              'Shop',
              style: TextStyle(
                color: Color.fromARGB(255, 3, 31, 88),
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.payment,
              color: Color.fromARGB(255, 120, 14, 7),
            ),
            title: Text(
              'Orders',
              style: TextStyle(
                color: Color.fromARGB(255, 120, 14, 7),
              ),
            ),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(OrdersScreen.routename);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.edit,
              color: Colors.black,
            ),
            title: Text(
              'Manage Products',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(UserProductsScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
