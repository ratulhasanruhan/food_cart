import 'package:food_cart/controller/ApiService.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  ApiService apiService = ApiService();

  var items = [].obs;
  var vat = 0.obs;
  var note = '';

  var cartItems = [].obs;

 @override
  onInit() {
    loadItems();
    super.onInit();
  }

  loadItems() async{
    print('loading items');
    await apiService.getProducts().then((value) {
      items.assignAll(value.body['menu']);
      vat(value.body['vat']);
      note = value.body['note'];
    });
  }

  addToCart(item) {
   print(cartItems);
   if(cartItems.indexWhere((element) => element['id'] == item['id']) != -1){
      var index = cartItems.indexWhere((element) => element['id'] == item['id']);
      cartItems[index]['quantity'] += 1;
   } else {
     cartItems.add({
        'id': item['id'],
        'price': item['discount_price'] == 0 ? item['price'] : item['discount_price'],
        'quantity': 1
     });
   }
  }

  removeFromCart(item) {
    if(cartItems.indexWhere((element) => element['id'] == item['id']) != -1){
      var index = cartItems.indexWhere((element) => element['id'] == item['id']);
      if(cartItems[index]['quantity'] > 1){
        cartItems[index]['quantity'] -= 1;
      } else {
        cartItems.removeAt(index);
      }
    }
  }

  double get subTotal {
    double total = 0;
    for(var item in cartItems){
      total += item['price'] * item['quantity'];
    }
    return total;
  }

  double get vatAmount {
    return (vat.value / 100) * subTotal;
  }



}