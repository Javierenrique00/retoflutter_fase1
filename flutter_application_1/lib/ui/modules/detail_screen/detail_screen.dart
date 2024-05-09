import 'package:flutter/material.dart';

import '../../../domain/model/product_model.dart';
import '../common/color_app.dart';
import 'product_detail_card_widget.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle del producto'),
        backgroundColor: ColorApp.appBarrBackground,
      ),
      body: ProductDetailCardWidget(product: product,),
    );
  }
}