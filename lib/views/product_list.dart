import 'package:flutter/material.dart';
import '../models/product.dart';
import 'widgets/product_card.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;

  const ProductList({required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductCard(product: products[index]);
      },
    );
  }
}
