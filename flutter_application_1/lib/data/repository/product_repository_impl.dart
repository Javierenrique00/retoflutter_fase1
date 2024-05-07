

import '../../domain/models/product.dart';
import '../datasource/local/local_product_datasource.dart';
import 'product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl({required this.datasource});

  final LocalProductDatasource datasource; 


  @override
  List<Product> getAllProducts() => datasource.getAllProducts();

  @override
  Product? getProduct(int id) => datasource.getProduct(id);



}