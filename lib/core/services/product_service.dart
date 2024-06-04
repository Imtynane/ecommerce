import 'dart:convert';

import 'package:ecommerce/core/models/product.dart';
import 'package:ecommerce/utils/const.dart';
import 'package:http/http.dart' as http;

class ProductService {
  static var client = http.Client();
  static var baseUrl = Const.apiUrl;
  static var header = {
    "Content-type": "application/json",
  };

  //Récupérer les infos avec la méthod http get
  static Future<List<dynamic>> getAll() async {
    var url = Uri.parse(baseUrl);
    try {
      var response = await client.get(url, headers: header);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load articles');
      }
    } catch (e) {
      throw Exception("Impossible de charger les données");
    }
  }

  //Ajouter les infos avec la méthod http get
  static Future<dynamic> create(Product p) async {
    var url = Uri.parse(baseUrl);
    try {
      var response =
          await client.post(url, headers: header, body: jsonEncode(p.toJson()));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create article ${response.statusCode}');
      }
    } catch (e) {
      throw Exception("$e");
    }
  }

  //Modifier les infos avec la méthod http get
  static Future<dynamic> update(Product p) async {
    var url = Uri.parse(baseUrl);
    try {
      var response =
          await client.put(url, headers: header, body: jsonEncode(p.toJson()));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to update article');
      }
    } catch (e) {
      throw Exception("Impossible de modifier les données");
    }
  }

  //Supprimer les infos avec la méthod http get
  static Future<void> delete(id) async {
    var url = Uri.parse("$baseUrl/$id");
    try {
      var response = await client.delete(url, headers: header);
      if (response.statusCode == 200) {
        return;
      } else {
        throw Exception('Failed to delete article');
      }
    } catch (e) {
      throw Exception("Impossible de supprimer les données");
    }
  }
}
