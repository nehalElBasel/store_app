import 'package:simple_store_app/http_api.dart';
import 'package:simple_store_app/models/product_model.dart';

class GetProductService {
  final url = "/products/category";
  Future<ProductModel> getProduct(String categoryName) async {
    // try {
    ProductModel product;
    Map<String, dynamic> dynamicProduct = await HttpApi().get(
      "$url/$categoryName",
    );
    product = ProductModel.fromJson(dynamicProduct);

    return product;
    // } catch (e) {
    //   throw Exception(e.toString());
    // }
  }
}
