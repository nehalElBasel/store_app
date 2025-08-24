import 'package:store_app/http_api.dart';

class GetProductService {
  final url = "/products";
  getProducts() async {
    List<dynamic> products = await HttpApi().get(url);
  }
}
