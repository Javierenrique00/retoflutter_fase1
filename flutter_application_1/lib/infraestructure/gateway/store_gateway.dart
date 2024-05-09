
import '../../domain/model/product_model.dart';

abstract class StoreGateway {

  List<ProductModel> getAllProducts();
  ProductModel? getProduct(int id);
  
}