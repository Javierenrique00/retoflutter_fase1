import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/model/product_model.dart';
import '../../../domain/viewmodel/app_viewmodel.dart';
import '../../navigation/navigation.dart';
import '../common/utils.dart';
import 'detail_item_widget.dart';

class ProductDetailCardWidget extends StatelessWidget {
  const ProductDetailCardWidget({required this.product, super.key});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, viewModel, child) {
      return Center(
        child: Card(
          child: Container(
            margin: const EdgeInsets.all(20),
            width: 300,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DetailItemWidget(title: 'Id: ', content: '${product.id}'),
                DetailItemWidget(title: 'Nombre: ', content: product.name),
                DetailItemWidget(
                    title: 'Descripción: ', content: product.description),
                DetailItemWidget(
                    title: 'Precio: ',
                    content: Utils.convCurrency(product.price)),
                DetailItemWidget(title: 'Cantidad: ', content: '${product.qty}'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () => Navigator.pushNamed(
                            context, Navigation.formScreen,
                            arguments: product),
                        icon: const Icon(Icons.edit)),
                    IconButton(
                        onPressed: () {
                          viewModel.deleteProduct(product.id);
                          Navigator.popUntil(context, (route) => route.isFirst);
                        }, icon: const Icon(Icons.delete)),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
