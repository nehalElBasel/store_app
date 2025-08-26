import 'package:simple_store_app/http_api.dart';
import 'package:simple_store_app/models/product_model.dart';

class UpdateProductService {
  Future<ProductModel> updateProduct(ProductModel product) async {
    try {
      final String url = "/products/${product.id}";

      Map<String, dynamic> dynamicProduct = await HttpApi().update(
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
