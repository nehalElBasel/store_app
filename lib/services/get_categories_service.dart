import 'package:simple_store_app/http_api.dart';

class GetCategoriesService {
  final url = "/products/categories";
  Future<List<String>> getCategories() async {
    try {
      List<String> categories = [];
      List<dynamic> dynamicCategories = await HttpApi().get(url);
      dynamicCategories.forEach((item) {
        categories.add(item);
      });
      return categories;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
