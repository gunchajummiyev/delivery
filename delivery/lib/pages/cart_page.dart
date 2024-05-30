import 'package:delivery/components/my_button.dart';
import 'package:delivery/models/restaurant.dart';
import 'package:delivery/pages/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child){
      //cart
      final userCart = restaurant.cart;

      return Scaffold(
        appBar: AppBar(
          title: const Text("Cart"),
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [

            IconButton(onPressed: () {
              showDialog(context: context,
              builder: (context) => AlertDialog(
                title: const Text("Are you sure you want to clear the cart?"),
                actions: [
                  //cancel button
                  TextButton(onPressed: () => Navigator.pop(context),
                      child: const Text("Cancel"),
                  ),

                  //yes button
                  TextButton(onPressed: () {
                    Navigator.pop(context);
                    restaurant.clearCart();
                  },
                    child: const Text("Yes"),
                  ),
                ],
              ),
              );
            },
                icon: const Icon(Icons.delete))
          ],
        ),
        body: Column(
          children: [

            //list of cart
            Expanded(
              child: Column(
                children: [
                  userCart.isEmpty
                      ? const Expanded(child: Center(
                      child: const Text("Cart is emty.."),
                  ),
                  )
                      :Expanded(
                      child: ListView.builder(
                        itemCount: userCart.length,
                          itemBuilder: (context, index) {

                          final cartItem = userCart[index];

                            return ListTile(
                              title: Text(cartItem.food.name),
                            );
                        },
                          ),
                      ),
                ],
              ),
            ),

            //button to pay
            MyButton(text: "Go to checkout", onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PaymentPage(),
                ),
            )),

            const SizedBox(height: 25),
          ],
        ),
      );
    },);
  }
}
