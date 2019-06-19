import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_service.dart';

class CatalogPage extends StatefulWidget {
  CatalogPage();

  @override
  _CatalogPageState createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  final _formKey = GlobalKey<FormState>();
  String _name;
  String _price;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(height: 20.0),
          Text(
            'Tab State Example',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20.0),
          Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(children: <Widget>[
                  TextFormField(
                      onSaved: (value) => _name = value,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(labelText: "Product Name")),
                  TextFormField(
                      onSaved: (value) => _price = value,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: "Product Price")),
                ]),
              )),
          SizedBox(height: 20.0),
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
        ],
      ),
    );
  }
}
