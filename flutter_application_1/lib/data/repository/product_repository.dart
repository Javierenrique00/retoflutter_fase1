
import '../../domain/models/product.dart';

abstract class ProductRepository {

  List<Product> getAllProducts();
  Product? getProduct(int id);
  
}