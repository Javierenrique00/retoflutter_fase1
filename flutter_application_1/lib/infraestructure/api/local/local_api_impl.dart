

import '../../../domain/model/product_model.dart';
import 'local_api.dart';

class LocalApiImpl implements LocalApi {

  final _allProducts = [
      ProductModel(id: 1, name: 'Manzana', description: 'Manzana Fresca', price: 2000, qty: 10),
      ProductModel(id: 2, name: 'Pera', description: 'Pera verde', price: 2500, qty: 10),
      ProductModel(id: 3, name: 'Limon', description: 'Limon en malla', price: 5000, qty: 25),
      ProductModel(id: 4, name: 'Apio', description: 'Apio en rama', price: 2300, qty: 25),
    ];

  @override
  List<ProductModel> getAllProducts() {
    return _allProducts;
  }

  @override
  ProductModel? getProduct(int id) {
    try{
      final product = _allProducts.firstWhere((element) => element.id == id);
      return product;
    }catch(error){
      return null;
    }
  }
  


}