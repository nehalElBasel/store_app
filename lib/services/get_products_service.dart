import 'package:simple_store_app/http_api.dart';
import 'package:simple_store_app/models/product_model.dart';

class GetProductService {
  final url = "/products";
  Future<List<ProductModel>> getProducts() async {
    try {
      List<ProductModel> products = [];
      List<dynamic> dynamicProducts = await HttpApi().get(url);
      dynamicProducts.forEach((item) {
        products.add(ProductModel.fromJson(item));
      });
      return products;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
