import 'package:flutter/material.dart';

import '../../data/repository/product_repository.dart';
import '../models/product_model.dart';

class AppViewModel extends ChangeNotifier {

  AppViewModel({required this.repository});

  final ProductRepository repository;
  final List<ProductModel> _products = [];
  
  void getAllProductsFromRepository(){
    _products.clear();
    _products.addAll(repository.getAllProducts());
    notifyListeners();
  }

  List<ProductModel> getProducts() => _products;

  void setProduct(ProductModel product){  
    if(product.id == -1){
      final maxId = _products.fold<int>(0,(prev,item) =>(item.id>prev)?item.id:prev );
      _products.add(ProductModel(id: maxId + 1, name: product.name, description: product.description, price: product.price, qty: product.qty));
      notifyListeners();
    }else{
      final indexFound = _products.indexWhere((element) => element.id == product.id);
      if(indexFound >- 1){
        _products[indexFound] = product;
        notifyListeners();
      }
    }    
  }

  void deleteProduct(int id){
    final indexFound = _products.indexWhere((element) => element.id == id);
    if(indexFound >- 1){
      _products.removeAt(indexFound);
      notifyListeners();
    }

  }
}