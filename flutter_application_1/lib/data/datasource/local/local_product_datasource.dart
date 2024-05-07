
import '../../../domain/models/product.dart';

abstract class LocalProductDatasource {

  List<Product> getAllProducts();
  Product? getProduct(int id);

}