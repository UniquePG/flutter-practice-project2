import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:self_practice/pages/CartApp/Cart.dart';
import 'package:self_practice/pages/CartApp/CartProvider.dart';
import 'package:self_practice/pages/CartApp/ProductModel.dart';

class CartApp extends StatelessWidget {
  CartApp({super.key});

  @override
  Widget build(BuildContext context) {
    // var cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Color.fromARGB(255, 247, 213, 224),
        backgroundColor: Colors.green,
        title: const Center(
            child: Text(
          "Products List",
        )),
      ),
      body: Consumer<CartProvider>(
        // Consuer has a builder that takes three value -> context, value, child
        // by Value-> we can acces the elements of our provider like variables or functions
        builder: ((context, providerValues, child) => ListView.separated(
            itemBuilder: (constex, index) {
              // var cartProvider = Provider.of<CartProvider>(context);

              Products product = providerValues.productsList[index];

              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        Text(
                          product.price.toString(),
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        ElevatedButton(

                            // style of elevated button
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              // backgroundColor:
                              //     Color.fromARGB(255, 247, 213, 224),
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.yellow,
                            ),
                            // foregroundColor:
                            //     Color.fromARGB(255, 237, 108, 151)),
                            onPressed: () {
                              // cartProvider.addToCart(product);
                              providerValues.addToCart(product);

                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Congratulation!"),
                                      content: Text(
                                        " ${providerValues.cartItems.firstWhere((element) => element.name == product.name, orElse: () => product).quantity} ${providerValues.cartItems.firstWhere((element) => element.name == product.name).name} added in your cart!!",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text("Ok"))
                                      ],
                                      elevation: 10,
                                      backgroundColor:
                                          Color.fromARGB(255, 248, 228, 234),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                    );
                                  });
                            },
                            child: Container(
                              child: const Text(
                                "Add to cart",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                            )),
                        Text(
                          'Count: ${providerValues.cartItems.isNotEmpty ? providerValues.cartItems.firstWhere((element) => element.name == product.name, orElse: () => product).quantity : "0"}',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 10,
              );
            },
            itemCount: providerValues.productsList.length)),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 84, 79, 81),
        elevation: 15,
        highlightElevation: 12,
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Cart()));
        },
        child: const Icon(
          Icons.shopping_bag,
          size: 35,
          color: Color.fromARGB(255, 237, 108, 151),
        ),
      ),
    );
  }
}
