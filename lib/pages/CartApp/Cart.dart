import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:self_practice/pages/CartApp/CartProvider.dart';

class Cart extends StatelessWidget {
  Cart({super.key});

  @override
  Widget build(BuildContext context) {
    // var cartProvider = Provider.of<CartProvider>(context);
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("cart"),
        ),
        body: Consumer<CartProvider>(
          builder: ((context, providerValues, child) => ListView.separated(
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Product Name: ${providerValues.cartItems[index].name}",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Quantity: ${providerValues.cartItems[index].quantity}",
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                providerValues.removeFromCart(
                                    providerValues.cartItems[index]);
                              },
                              child: const Icon(Icons.remove))
                        ],
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: providerValues.cartItems.length)),
        ),
      ),
    );
  }
}
