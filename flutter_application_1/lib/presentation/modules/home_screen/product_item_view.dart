import 'package:flutter/material.dart';

import '../../../domain/models/product.dart';

class ProductItemView extends StatelessWidget {
  const ProductItemView({required this.product, super.key});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text("${product.name}"),
      Text("${product.price}"),
    ],);
  }
}