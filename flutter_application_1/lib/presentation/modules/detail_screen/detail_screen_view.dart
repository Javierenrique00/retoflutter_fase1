import 'package:flutter/material.dart';

import '../../../domain/models/product.dart';
import '../common/color_app.dart';
import 'product_detail_card_view.dart';

class DetailScreenView extends StatelessWidget {
  const DetailScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle del producto'),
        backgroundColor: ColorApp.appBarrBackground,
      ),
      body: ProductDetailCardView(product: product,),
    );
  }
}