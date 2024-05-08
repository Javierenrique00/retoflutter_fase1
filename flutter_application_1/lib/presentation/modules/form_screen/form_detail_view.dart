import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/models/product.dart';
import '../../navigation/navigation.dart';
import '../../../domain/viewmodels/app_viewmodel.dart';
import 'edit_field_view.dart';
import 'input_type.dart';


class FormDetailView extends StatefulWidget {
  FormDetailView({required this.product, super.key});
  Product product;

  @override
  State<FormDetailView> createState() => _FormDetailViewState(product: product);
}

class _FormDetailViewState extends State<FormDetailView> {
Product product;
final _formKey = GlobalKey<FormState>();
late String _name;
late String _description;
late double _price;
late int _qty;

_FormDetailViewState({required this.product}){
    this._name = product.name;
    this._description = product.description;
    this._price = product.price;
    this._qty = product.qty;
}


  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, viewModel, child) {
        return Form(
          key: _formKey,
          child: Column(
          children: [
            EditFieldRow(name: "Nombre:", strValue: product.name,type: InputType.stringShortType ,onButtonPressed: (String value){ _name = value;}, ),
            EditFieldRow(name: "Descripción:", strValue: product.description,type: InputType.stringLongType ,onButtonPressed: (String value){ _description = value;}, ),
            EditFieldRow(name: "Precio:", strValue: product.price.toString(),type: InputType.doubleType ,onButtonPressed: (String value){ _price = double.parse(value);}, ),
            EditFieldRow(name: "Cantidad:", strValue: product.qty.toString(),type: InputType.intType ,onButtonPressed: (String value){ _qty = int.parse(value);}, ),
            SizedBox(
              width: 200,
              child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              TextButton(onPressed: (){
                if(_formKey.currentState!.validate()){
                  viewModel.setProduct(Product(id: product.id, name: _name, description: _description, price: _price, qty: _qty));
                  Navigator.popUntil(context, (route) => route.isFirst);
                }
              } , child: Text('Salvar')),
              if(product.id != -1) TextButton(onPressed: (){
                viewModel.deleteProduct(product.id);
                Navigator.popUntil(context, (route) => route.isFirst);
              } , child: Text('Eliminar'))
            ],),
            ),
          ]
        ),);
      });
  }
}