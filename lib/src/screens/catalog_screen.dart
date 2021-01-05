import 'package:MyCart/src/data/products.dart';
import 'package:MyCart/src/models/product_model.dart';
import 'package:MyCart/src/screens/cart_screen.dart';
import 'package:flutter/material.dart';

class CatalogScreen extends StatefulWidget {
  @override
  _CatalogScreenState createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  List<ProductModel> cart = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Text(
            "(${cart.length})",
            style: TextStyle(color: Colors.black),
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              size: 30,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(cart: cart),
                ),
              );
            },
          ),
        ],
        backgroundColor: Colors.yellowAccent[700],
        title: Text(
          "Catelog",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          for (var product in products) _buildCatalog(product),
        ],
      ),
    );
  }

  Widget _buildCatalog(ProductModel product) {
    return ListTile(
      leading: Icon(Icons.tab),
      trailing: cart.contains(product)
          ? Icon(Icons.check)
          : FlatButton(
              child: Text("ADD"),
              onPressed: () {
                setState(() {
                  cart.add(product);
                });
              },
            ),
      title: Text(product.name),
      subtitle: Text("Rs. ${product.price}"),
    );
  }
}
