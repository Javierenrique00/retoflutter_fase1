import 'package:flutter/material.dart';

import '../../../domain/models/product.dart';
import '../common/color_app.dart';
import 'form_detail_view.dart';

class FormScreenView extends StatefulWidget {
  const FormScreenView({super.key});

  @override
  State<FormScreenView> createState() => _FormScreenViewState();
}

class _FormScreenViewState extends State<FormScreenView> {
  @override
  Widget build(BuildContext context) {

    final arguments = ModalRoute.of(context)!.settings.arguments;
    final product = (arguments == null)? Product(id: -1,name: "",description: "",price: 0.0,qty: 0): arguments as Product;

    return Scaffold(
      appBar: AppBar(
        title: Text('Edición de producto'),
        backgroundColor: ColorApp.AppBarrBackground,
      ),
      body: FormDetailView(product: product,),

    );
  }
}