
import '../../domain/models/product_model.dart';

abstract class ProductRepository {

  List<ProductModel> getAllProducts();
  ProductModel? getProduct(int id);
  
}