

import '../../../domain/models/product.dart';
import 'local_product_datasource.dart';

class LocalProductDatasourceImpl implements LocalProductDatasource {

  final _allProducts = [
      Product(id: 1, name: 'Manzana', description: 'Manzana Fresca', price: 2000, qty: 10),
      Product(id: 2, name: 'Pera', description: 'Pera verde', price: 2500, qty: 10),
      Product(id: 3, name: 'Limon', description: 'Limon en malla', price: 5000, qty: 25),
      Product(id: 4, name: 'Apio', description: 'Apio en rama', price: 2300, qty: 25),
    ];

  @override
  List<Product> getAllProducts() {
    return _allProducts;
  }

  @override
  Product? getProduct(int id) {
    try{
      final product = _allProducts.firstWhere((element) => element.id == id);
      return product;
    }catch(error){
      return null;
    }
  }
  


}