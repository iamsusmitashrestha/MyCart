import 'package:MyCart/src/models/product_model.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  final List<ProductModel> cart;

  CartScreen({this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          for (var cartItem in cart) _buildCart(cartItem),
        ],
      ),
    );
  }

  Widget _buildCart(ProductModel product) {
    return ListTile(
      leading: Icon(Icons.tab),
      title: Text(product.name),
      subtitle: Text("Rs. ${product.price}"),
    );
  }
}
