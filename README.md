# Flutter Tabs w/ State Management

A new Flutter project demonstrating the use of the Tabs Widget and using the Provider Pattern for managing stage between the tabs


The Provider is the recommended method for managing state in Flutter Application and was presented at Google IO and is at the top of the stack for state management in the Flutter Documentation on State Management

**service as my provider...**
```dart
import 'dart:collection';
import 'package:flutter/material.dart';

class Item {
  String name;
  num price;

  Item(this.name, this.price);
}

class CartModel extends ChangeNotifier {
  /// Internal, private state of the cart.
  final List<Item> _items = [];

  /// An unmodifiable view of the items in the cart.
  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  /// The current total price of all items (assuming all items cost $42).
  /// int get totalPrice => _items.length * 42;

  /// Adds [item] to cart. This is the only way to modify the cart from outside.
  void add(Item item) {
    _items.add(item);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
}
```
**Setting up Access to State**

```dart
void main() => runApp(
      ChangeNotifierProvider<CartModel>(
        child: TabBarDemo(),
        builder: (BuildContext context) {
          return CartModel();
        },
      ),
    );
```
**Accessing State from top level to display count in tab title**
```dart
class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var count = Provider.of<CartModel>(context).items.length;
```
**Accessing State from first tab when adding item to the cart**
```dart
  RaisedButton(
      child: Text("Add Item"),
      onPressed: () async {
        final form = _formKey.currentState;
        form.save();
        if (form.validate()) {
          Provider.of<CartModel>(context)
              .add(new Item(_name, num.parse(_price)));
        } else {
          print('validate failed');
        }
        _formKey.currentState.reset();
      })
 ```
- See the complete example here: https://github.com/aaronksaunders/flutter_simple_tabs
- This code is based on the [Flutter Documentation Example](https://github.com/filiph/samples/tree/provider-shopper/provider_shopper)

## More Information On Getting Started with Flutter

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
