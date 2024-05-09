

import '../../domain/models/product_model.dart';
import '../datasource/local/local_product_datasource.dart';
import 'product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl({required this.datasource});

  final LocalProductDatasource datasource; 


  @override
  List<ProductModel> getAllProducts() => datasource.getAllProducts();

  @override
  ProductModel? getProduct(int id) => datasource.getProduct(id);



}