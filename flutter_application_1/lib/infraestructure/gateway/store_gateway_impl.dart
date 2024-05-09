

import '../../domain/model/product_model.dart';
import '../api/local/local_api.dart';
import 'store_gateway.dart';

class StoreGatewayImpl implements StoreGateway {
  StoreGatewayImpl({required this.datasource});

  final LocalApi datasource; 


  @override
  List<ProductModel> getAllProducts() => datasource.getAllProducts();

  @override
  ProductModel? getProduct(int id) => datasource.getProduct(id);



}