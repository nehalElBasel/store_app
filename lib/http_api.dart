import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpApi {
  final String baseUrl = "https://fakestoreapi.com";

  Future<dynamic> get(String url) async {
    http.Response response = await http.get(Uri.parse("$baseUrl$url"));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
        "there is an error with status ${response.statusCode} and body ${response.body}",
      );
    }
  }

  Future<Map<String, dynamic>> post({
    required String url,
    required Map<String, dynamic> body,
    Map<String, String>? headers,
  }) async {
    http.Response response = await http.post(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
        "there is an error with status ${response.statusCode} and body ${response.body}",
      );
    }
  }
}
