import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'input_type.dart';

class EditFieldRow extends StatefulWidget {
  final Function (String) onButtonPressed;

  EditFieldRow({required this.name,required this.strValue,required this.type,required this.onButtonPressed, super.key});
  final String name;
  String strValue;
  InputType type;
  
  @override
  State<EditFieldRow> createState() => _EditFieldRowState(name: name,strValue: strValue,);
}

class _EditFieldRowState extends State<EditFieldRow> {
  _EditFieldRowState({required this.name,required this.strValue});
  final String name;
  String strValue;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: SizedBox(
        width: 300,
        child: TextFormField(
          initialValue: strValue,
          validator:(value) => validate(value,widget.type),
          onChanged: (String value)=> widget.onButtonPressed(value),
          obscureText: false,
          keyboardType: TextInputType.number,
          inputFormatters: getInputFormater(widget.type), 
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "$name",
          ),
        ),
      ),
    );
  }

  List<TextInputFormatter> getInputFormater(InputType type) => switch(type){
    InputType.stringType => [FilteringTextInputFormatter.singleLineFormatter ],
    InputType.doubleType => [FilteringTextInputFormatter.allow((RegExp("[.0-9]"))) ],
    InputType.intType => [FilteringTextInputFormatter.allow((RegExp("[0-9]"))) ],
    _ => [FilteringTextInputFormatter.singleLineFormatter ]
  };

  String? validate(String? value,InputType type) => switch(type){
    InputType.stringType => checkString(value,type),
    InputType.doubleType => checkDouble(value, type),
    InputType.intType => checkInt(value, type),
    _ => null
  };

  String? checkString(String? value,InputType type){
    if(value == null || value!.isEmpty ){
      return "Entre un valor";
    }else{
      return null;
    }
  }

  String? checkDouble(String? value,InputType type){
    if(value == null || value!.isEmpty){
      return "Entre un valor";
    }else if(value!.length > 10){
        return "Cantidad con muchos dígitos";
    }else{
      try{
        double.parse(value!);
      }catch(error){
        return "Entre un número válido !";
      }
      return null;
    }
  }

    String? checkInt(String? value,InputType type){
    if(value == null || value!.isEmpty){
      return "Entre un valor";
    }else if(value!.length > 10){
      return "Cantidad con muchos dígitos";
    }else{
      try{
        int.parse(value!);
      }catch(error){
          return "Entre una cantidad válida !";
      }
      return null;
    }
  }

}