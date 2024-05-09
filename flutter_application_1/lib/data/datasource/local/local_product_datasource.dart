
import '../../../domain/models/product_model.dart';

abstract class LocalProductDatasource {

  List<ProductModel> getAllProducts();
  ProductModel? getProduct(int id);

}