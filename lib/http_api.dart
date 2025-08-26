import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:simple_store_app/models/product_model.dart';

class HttpApi {
  final String baseUrl = "https://fakestoreapi.com";

  Future<dynamic> get(String url) async {
    http.Response response = await http.get(Uri.parse("$baseUrl$url"));
    if (response.statusCode == 200) {
      // print(jsonDecode(response.body));

      return jsonDecode(response.body);
    } else {
      throw Exception(
        "there is an error with status ${response.statusCode} and body ${response.body}",
      );
    }
  }

  Future<Map<String, dynamic>> post({
    required String url,
    required ProductModel body,
    Map<String, String>? headers,
  }) async {
    headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Accept': '*/*',
    };
    http.Response response = await http.post(
      Uri.parse("$baseUrl$url"),
      body: {
        "title": body.title,
        "price": body.price.toString(),
        "description": body.describtion,
        "image": body.image,
        "category": body.category,
      },
      headers: headers,
    );
    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
        "there is an error with status ${response.statusCode} and body ${response.body}",
      );
    }
  }

  Future<Map<String, dynamic>> update({
    required String url,
    required ProductModel body,
    Map<String, String>? headers,
  }) async {
    http.Response response = await http.put(
      Uri.parse("$baseUrl$url/${body.id}"),

      body: {
        "title": body.title,
        "price": body.price.toString(),
        "description": body.describtion,
        "image": body.image,
        "category": body.category,
      },
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
        "there is an error with status ${response.statusCode} and body ${response.body}",
      );
    }
  }
}
