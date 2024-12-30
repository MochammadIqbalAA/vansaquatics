import 'package:get/get.dart';

import '../../../models/cart_models.dart';
import '../views/cart_page_view.dart';

class CartPageController extends GetxController {
  
  var cartItems = <CartItem>[].obs; // Observable list of CartItem


  void addItem(CartItem item) {
    int index = cartItems.indexWhere((element) => element.id == item.id);
    if (index != -1) {
      cartItems[index].quantity++;
      cartItems.refresh();
    } else {
      cartItems.add(item);
    }
  }

  void decreaseQuantity(String id) {
  int index = cartItems.indexWhere((item) => item.id == id);
  if (index != -1) {
    if (cartItems[index].quantity > 1) {
      cartItems[index].quantity--;
      cartItems.refresh();
    } else {
      removeItem(id); // Menghapus item jika quantity mencapai 1
    }
  }
}


  void removeItem(String id) {
    cartItems.removeWhere((item) => item.id == id);
  }


 int get totalPrice {
  return cartItems.fold(0, (sum, item) => sum + (double.parse(item.price) * item.quantity).toInt());
}



  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
  
}


