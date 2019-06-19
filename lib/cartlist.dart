import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_service.dart';

class ItemsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var items = Provider.of<CartModel>(context).items;
    return ListView.builder(
      itemCount: items != null ? items.length : 0,
      itemBuilder: (_, int index) {
        final Item item = items[index];
        return ListTile(title: Text(item.name), subtitle: Text('Price: \$${item.price.toString()}'), key: Key(item.name));
      },
    );
  }
}
