import 'package:flutter/material.dart';
import '../providers/orders.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('ORDERS'),
      ),
      body: ListView.builder(itemCount: orderData.orders.length,itemBuilder: (ctx,i)=>),
    );
  }
}
