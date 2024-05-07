import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/datasource/local/local_product_datasource_impl.dart';
import '../../../data/repository/product_repository_impl.dart';
import '../../navigation/navigation.dart';
import 'home_screen_viewmodel.dart';
import 'list_product_view.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de productos'),
        backgroundColor: Colors.amber,
      ),
      body: ChangeNotifierProvider(
        create: (context) => HomeScreenViewModel(
            repository: ProductRepositoryImpl(
                datasource: LocalProductDatasourceImpl())),
      child: ListProductsView(),
      ),
      
    );
  }
}

            //Este e sel boton para navegar de ejemplo

            // TextButton(
            //     onPressed: () =>
            //         Navigator.of(context).pushNamed(Navigation.detailScreen),
            //     child: Text('Goto detail'))