import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:simple_tabs/catalog.dart';

import 'cart_service.dart';
import 'cartlist.dart';

void main() => runApp(
      ChangeNotifierProvider<CartModel>(
          child: TabBarDemo(), //
          create: (context) => CartModel()),
    );

class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var count = Provider.of<CartModel>(context).items.length;
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.list)),
                Tab(
                  icon: Icon(Icons.shopping_cart),
                  text: '$count',
                ),
              ],
            ),
            title: Text('Tabs Demo'),
          ),
          body: TabBarView(
            children: [
              CatalogPage(),
              ItemsList(),
            ],
          ),
        ),
      ),
    );
  }
}
