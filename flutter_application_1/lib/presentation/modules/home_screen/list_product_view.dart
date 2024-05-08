import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../navigation/navigation.dart';
import '../common/utils.dart';
import '../../../domain/viewmodels/app_viewmodel.dart';

class ListProductsView extends StatefulWidget {
  const ListProductsView({super.key});

  @override
  State<ListProductsView> createState() => _ListProductsViewState();
}

class _ListProductsViewState extends State<ListProductsView> {
  var hasInit = false;

  @override
  void initState() {
    super.initState();
    hasInit = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child:
          Consumer<AppViewModel>(builder: (context, viewModel, child) {
        if (!hasInit) {
          hasInit = true;
          viewModel.getAllProductsFromRepository();
        }
        final products = viewModel.getProducts();
        return SizedBox(
          width: 300,
          child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(products[index].name),
              trailing: Text(Utils.convCurrency(products[index].price)),
              onTap: () => Navigator.pushNamed(context, Navigation.detailScreen,
                  arguments: products[index]),
            ),
          ),
        );
      }),
    );
  }
}
