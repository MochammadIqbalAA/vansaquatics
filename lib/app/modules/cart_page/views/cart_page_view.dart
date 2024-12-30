import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../checkout/views/checkout_view.dart';
import '../controllers/cart_page_controller.dart';

class CartPage extends StatelessWidget {
  final CartPageController cartController = Get.put(CartPageController()); // Inisialisasi controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
        actions: [
          TextButton(
            onPressed: () => cartController.cartItems.clear(), // Clear cart
            child: Text('Clear', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
      body: Obx(() {
        if (cartController.cartItems.isEmpty) {
          return Center(child: Text('Your cart is empty.'));
        }

        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartController.cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartController.cartItems[index];

                  return Stack(
                    children: [
                      ListTile(
                        leading: SizedBox(
                          width: 100,
                          height: 100,
                          child: Image.network(item.imageUrl, fit: BoxFit.cover),
                        ),
                        title: Text(item.name),
                        subtitle: Text('Rp. ${item.price}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () => cartController.decreaseQuantity(cartController.cartItems[index].id),
                            ),
                            Text(item.quantity.toString()),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () => cartController.addItem(item),
                            ),
                            SizedBox(width: 10,)
                            
                          ],
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: IconButton(
                          iconSize: 20,
                            icon: Icon(Icons.delete, color: Colors.red,),
                            onPressed: () => cartController.removeItem(cartController.cartItems[index].id),
                          ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total: Rp. ${cartController.totalPrice}', style: TextStyle(fontSize: 18)),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CheckoutView()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: Text(
                      'Checkout',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
