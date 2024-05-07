import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../data/repository/product_repository.dart';
import '../../../domain/models/product.dart';

class HomeScreenViewModel extends ChangeNotifier {

  HomeScreenViewModel({required this.repository});

  final ProductRepository repository;
  List<Product> _products = [];
  
  void getAllProductsFromRepository(){
    _products.clear();
    _products.addAll(repository.getAllProducts());
    notifyListeners();
  }

  List<Product> getProducts() => _products;




}