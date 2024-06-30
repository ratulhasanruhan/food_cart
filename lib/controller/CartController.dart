import 'package:food_cart/controller/ApiService.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  ApiService apiService = ApiService();

  var items = [].obs;

 @override
  onInit() {
    loadItems();
    super.onInit();
  }

  loadItems() async{
    print('loading items');
    await apiService.getProducts().then((value) {
      items.assignAll(value.body['menu']);
    });
  }

}