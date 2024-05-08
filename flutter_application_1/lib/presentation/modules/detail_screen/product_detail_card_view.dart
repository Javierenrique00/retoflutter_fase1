import 'package:flutter/material.dart';

import '../../../domain/models/product.dart';
import '../../navigation/navigation.dart';
import '../common/utils.dart';
import 'detail_item.dart';

class ProductDetailCardView extends StatelessWidget {
  const ProductDetailCardView({required this.product, super.key});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Container(
          margin: EdgeInsets.all(20),
          width: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailItem(title: 'Id: ', content: '${product.id}'),
              DetailItem(title: 'Nombre: ', content: '${product.name}'),
              DetailItem(title: 'Descripción: ', content: '${product.description}'),
              DetailItem(title: 'Precio: ', content: '${Utils.convCurrency(product.price)}'),
              DetailItem(title: 'Cantidad: ', content: '${product.qty}'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () => Navigator.pushNamed(
                          context, Navigation.formScreen,
                          arguments: product),
                      child: Text('Edit'))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
