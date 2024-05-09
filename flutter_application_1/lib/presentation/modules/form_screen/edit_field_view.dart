import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'input_type.dart';

class EditFieldRow extends StatefulWidget {
  final Function (String) onChanged;

  const EditFieldRow({required this.name,required this.strValue,required this.type,required this.onChanged, super.key});
  final String name;
  final String strValue;
  final InputType type;
  
  @override
  State<EditFieldRow> createState() => _EditFieldRowState();
}

class _EditFieldRowState extends State<EditFieldRow> {
  _EditFieldRowState();



  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: 300,
        child: TextFormField(
          initialValue: widget.strValue,
          validator:(value) => validate(value,widget.type),
          onChanged: (String value)=> widget.onChanged(value),
          obscureText: false,
          keyboardType: getKeyboard(widget.type),
          inputFormatters: getInputFormater(widget.type), 
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: widget.name,
          ),
        ),
      ),
    );
  }

  TextInputType getKeyboard(InputType type) => switch(type){
    InputType.stringShortType || InputType.stringLongType  => TextInputType.text,
    InputType.doubleType || InputType.intType  => TextInputType.number,
  };

  List<TextInputFormatter> getInputFormater(InputType type) => switch(type){
    InputType.stringShortType || InputType.stringLongType  => [FilteringTextInputFormatter.singleLineFormatter ],
    InputType.doubleType => [FilteringTextInputFormatter.allow((RegExp("[.0-9]"))) ],
    InputType.intType => [FilteringTextInputFormatter.allow((RegExp("[0-9]"))) ],
  };

  String? validate(String? value,InputType type) => switch(type){
    InputType.stringShortType => checkStringShort(value,type),
    InputType.stringLongType => checkStringLong(value,type),
    InputType.doubleType => checkDouble(value, type),
    InputType.intType => checkInt(value, type),
  };

  String? checkStringShort(String? value,InputType type){
    if(value == null || value.isEmpty ){
      return "Entre un valor";
    }else if(value.length > 15){
      return "Debe tener máximo 15 caracteres";
    }else{
      return null;
    }
  }

    String? checkStringLong(String? value,InputType type){
    if(value == null || value.isEmpty ){
      return "Entre un valor";
    }else if(value.length > 100){
      return "Debe tener máximo 100 caracteres";
    }else{
      return null;
    }
  }

  String? checkDouble(String? value,InputType type){
    if(value == null || value.isEmpty){
      return "Entre un valor";
    }else if(value.length > 10){
        return "Debe tener máximo 10 dígitos";
    }else{
      try{
        double.parse(value);
      }catch(error){
        return "Entre un número válido !";
      }
      return null;
    }
  }

    String? checkInt(String? value,InputType type){
    if(value == null || value.isEmpty){
      return "Entre un valor";
    }else if(value.length > 10){
      return "Debe tener máximo 10 dígitos";
    }else{
      try{
        int.parse(value);
      }catch(error){
          return "Entre una cantidad válida !";
      }
      return null;
    }
  }

}