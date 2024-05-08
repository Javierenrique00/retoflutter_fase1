import 'package:flutter/material.dart';

import '../../../domain/models/product.dart';
import '../../navigation/navigation.dart';
import 'product_detail_card_view.dart';

class DetailScreenView extends StatelessWidget {
  const DetailScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle del producto: ${product.name}'),
        backgroundColor: Colors.amber,
      ),
      body: ProductDetailCardView(product: product,),
    );
  }
}