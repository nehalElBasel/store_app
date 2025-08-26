import 'package:simple_store_app/http_api.dart';
import 'package:simple_store_app/models/product_model.dart';

class AddProductService {
  final String url = "/products";
  Future<ProductModel> addProduct(ProductModel product) async {
    try {
      ProductModel productt;
      Map<String, dynamic> dynamicProduct = await HttpApi().post(
        url: url,
        body: product,
      );
      product = ProductModel.fromJson(dynamicProduct);

      return product;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
