import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:restapi_practice/models/products_models.dart';
import 'package:restapi_practice/services/api_base_helper.dart';
import 'package:restapi_practice/services/app_exceptions.dart';

const BASE_URL = 'http://api.goblingt.com';

class ProductsService {

  Future<List<Product>> getProducts({int code = 200}) async {
    final url = '$BASE_URL/api/v1/products/public/$code';
    var responseJson;
    try {
      final resp = await http.get(url);
      responseJson = returnResponse(resp);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return productsResponseFromJson(responseJson).products;
  }
}
