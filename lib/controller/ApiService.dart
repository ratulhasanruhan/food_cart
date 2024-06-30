import 'package:food_cart/utils/constants.dart';
import 'package:get/get_connect/connect.dart';

class ApiService extends GetConnect {


  Future<Response> getProducts() async {
    try {
      var response = await get(productsUrl);
      return response;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

}