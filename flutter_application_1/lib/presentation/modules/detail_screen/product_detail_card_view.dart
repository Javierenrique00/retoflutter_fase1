import 'package:flutter/material.dart';

import '../../../domain/models/product.dart';
import '../../navigation/navigation.dart';

class ProductDetailCardView extends StatelessWidget {
  const ProductDetailCardView({required this.product, super.key});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          children: [
            Text('Id:${product.id}'),
            Text('Nombre:${product.name}'),
            Text('Descripción:${product.description}'),
            Text('Precio:${product.price}'),
            Text('Cantidad:${product.qty}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              TextButton(onPressed: ()=>Navigator.pushNamed(context, Navigation.formScreen,arguments: product) , child: Text('Edit'))
            ],),
          ],
        ),
      ),
    );
  }
}
