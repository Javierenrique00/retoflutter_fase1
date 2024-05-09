import 'package:flutter/material.dart';

import '../../../domain/model/product_model.dart';
import '../common/color_app.dart';
import 'form_detail_widget.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  @override
  Widget build(BuildContext context) {

    final arguments = ModalRoute.of(context)!.settings.arguments;
    final product = (arguments == null)? ProductModel(id: -1,name: "",description: "",price: 0.0,qty: 0): arguments as ProductModel;

    return Scaffold(
      appBar: AppBar(
        title: (arguments == null)? const Text('Nuevo producto'): const Text('Edición de producto'),
        backgroundColor: ColorApp.appBarrBackground,
      ),
      body: FormDetailWidget(product: product,),

    );
  }
}