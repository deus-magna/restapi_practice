import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restapi_practice/services/app_exceptions.dart';

dynamic returnResponse(http.Response response) {
  var responseJson = json.decode(response.body.toString());
  switch (response.statusCode) {
    case 200:
      return response.body;
    case 400:
      throw BadRequestException(responseJson['err']['message']);
    case 401:
    case 403:
      throw UnauthorizedException(responseJson['err']['message']);
    case 404:
      throw NotFoundException(responseJson['err']['message']);
    case 500:
      throw InternalServerException(responseJson['err']['message']);
    case 20201:
      throw InvalidInputException(responseJson['err']['message']);
    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}
