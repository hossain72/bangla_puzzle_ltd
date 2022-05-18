import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../data/constants/api_link.dart';
import '../../../data/models/product_model.dart';

class ProductProvider {
  Future<List<Product>> getProducts() async {
    var url = Uri.parse(ApiLink.API_LINK);

    final response = await http.get(url, headers: {
      "Content-Type": "application/json",
    });

    if (response.statusCode == 200) {
      return productFromJson(response.body);
    } else {
      return throw ("Error");
    }
  }
}
