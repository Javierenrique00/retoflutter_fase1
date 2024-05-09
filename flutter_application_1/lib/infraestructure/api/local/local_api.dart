
import '../../../domain/model/product_model.dart';

abstract class LocalApi {

  List<ProductModel> getAllProducts();
  ProductModel? getProduct(int id);

}