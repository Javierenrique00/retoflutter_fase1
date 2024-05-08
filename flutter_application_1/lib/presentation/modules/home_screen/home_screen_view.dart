import 'package:flutter/material.dart';

import '../../navigation/navigation.dart';
import '../common/color_app.dart';
import 'list_product_view.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de productos'),
        backgroundColor: ColorApp.appBarrBackground,
      ),
      body: const ListProductsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, Navigation.formScreen);
        },
        tooltip: 'Agregar items',
        child: const Icon(Icons.add),
      ),
    );
  }
}