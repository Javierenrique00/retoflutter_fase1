import 'package:flutter/material.dart';

import '../../navigation/navigation.dart';
import '../common/color_app.dart';
import 'list_products_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de productos'),
        backgroundColor: ColorApp.appBarrBackground,
      ),
      body: const ListProductsWidget(),
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