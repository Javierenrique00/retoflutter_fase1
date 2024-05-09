import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/models/product.dart';
import '../../../domain/viewmodels/app_viewmodel.dart';
import 'edit_field_view.dart';
import 'input_type.dart';


class FormDetailView extends StatefulWidget {
  const FormDetailView({required this.product, super.key});
  final Product product;

  @override
  State<FormDetailView> createState() => _FormDetailViewState();
}

class _FormDetailViewState extends State<FormDetailView> {

final _formKey = GlobalKey<FormState>();
late String _name;
late String _description;
late double _price;
late int _qty;

_FormDetailViewState();

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
            EditFieldRow(name: "Nombre:", strValue: widget.product.name,type: InputType.stringShortType ,onChanged: (String value){ _name = value;}, ),
            EditFieldRow(name: "Descripción:", strValue: widget.product.description,type: InputType.stringLongType ,onChanged: (String value){ _description = value;}, ),
            EditFieldRow(name: "Precio:", strValue: widget.product.price.toString(),type: InputType.doubleType ,onChanged: (String value){ _price = double.parse(value);}, ),
            EditFieldRow(name: "Cantidad:", strValue: widget.product.qty.toString(),type: InputType.intType ,onChanged: (String value){ _qty = int.parse(value);}, ),
            SizedBox(
              width: 200,
              child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              TextButton(onPressed: (){
                if(_formKey.currentState!.validate()){
                  viewModel.setProduct(Product(id: widget.product.id, name: _name, description: _description, price: _price, qty: _qty));
                  Navigator.popUntil(context, (route) => route.isFirst);
                }
              } , child: const Text('Salvar')),
              if(widget.product.id != -1) TextButton(onPressed: (){
                viewModel.deleteProduct(widget.product.id);
                Navigator.popUntil(context, (route) => route.isFirst);
              } , child: const Text('Eliminar'))
            ],),
            ),
          ]
        ),);
      });
  }
}