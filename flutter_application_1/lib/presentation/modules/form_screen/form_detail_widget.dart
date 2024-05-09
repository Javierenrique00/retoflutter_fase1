import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/models/product_model.dart';
import '../../../domain/viewmodels/app_viewmodel.dart';
import 'edit_field_widget.dart';
import 'input_type.dart';


class FormDetailWidget extends StatefulWidget {
  const FormDetailWidget({required this.product, super.key});
  final ProductModel product;

  @override
  State<FormDetailWidget> createState() => _FormDetailWidgetState();
}

class _FormDetailWidgetState extends State<FormDetailWidget> {

final _formKey = GlobalKey<FormState>();
late String _name;
late String _description;
late double _price;
late int _qty;

_FormDetailWidgetState();

  @override
  void initState() {
    super.initState();
    _name = widget.product.name;
    _description = widget.product.description;
    _price = widget.product.price;
    _qty = widget.product.qty;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, viewModel, child) {
        return Form(
          key: _formKey,
          child: Column(
          children: [
            EditFieldWidget(name: "Nombre:", strValue: widget.product.name,type: InputType.stringShortType ,onChanged: (String value){ _name = value;}, ),
            EditFieldWidget(name: "Descripción:", strValue: widget.product.description,type: InputType.stringLongType ,onChanged: (String value){ _description = value;}, ),
            EditFieldWidget(name: "Precio:", strValue: widget.product.price.toString(),type: InputType.doubleType ,onChanged: (String value){ _price = double.parse(value);}, ),
            EditFieldWidget(name: "Cantidad:", strValue: widget.product.qty.toString(),type: InputType.intType ,onChanged: (String value){ _qty = int.parse(value);}, ),
            SizedBox(
              width: 200,
              child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              TextButton(onPressed: (){
                if(_formKey.currentState!.validate()){
                  viewModel.setProduct(ProductModel(id: widget.product.id, name: _name, description: _description, price: _price, qty: _qty));
                  Navigator.popUntil(context, (route) => route.isFirst);
                }
              } , child: const Text('Salvar')),
            ],),
            ),
          ]
        ),);
      });
  }
}