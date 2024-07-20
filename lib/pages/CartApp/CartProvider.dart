import 'package:flutter/material.dart';
import 'package:self_practice/pages/CartApp/ProductModel.dart';

class CartProvider extends ChangeNotifier {
  // all products list
  List<Products> productsList = [
    Products(name: "Laptop", price: 40000.0),
    Products(name: "Mobile Phone", price: 15000.0),
    Products(name: "Smartwatch", price: 5000.0),
    Products(name: "Headphones", price: 2000.0),
    Products(name: "Digital Camera", price: 25000.0),
    Products(name: "Tablet", price: 12000.0),
    Products(name: "Gaming Console", price: 35000.0),
    Products(name: "Fitness Tracker", price: 3000.0),
    Products(name: "Desktop Computer", price: 50000.0),
    Products(name: "Printer", price: 8000.0),
    Products(name: "External Hard Drive", price: 4000.0),
    Products(name: "Wireless Earbuds", price: 6000.0),
    Products(name: "Coffee Maker", price: 3000.0),
    Products(name: "Blender", price: 2500.0),
    Products(name: "Electric Toothbrush", price: 1000.0),
    Products(name: "Sunglasses", price: 1500.0),
    Products(name: "Backpack", price: 2000.0),
    Products(name: "Smart Thermostat", price: 7000.0),
    Products(name: "Robot Vacuum Cleaner", price: 18000.0),
    Products(name: "Wireless Router", price: 12000.0),
    Products(name: "Portable Speaker", price: 2500.0),
    Products(name: "External Monitor", price: 15000.0),
    Products(name: "Drone", price: 30000.0),
  ];

  // make the cart items list
  List<Products> cartItems = [];

  void addToCart(Products product) {
    print("add to cart");
    Products existingProduct = cartItems.firstWhere(
      (element) => element.name == product.name,
      orElse: () => Products(
          name: product.name,
          price: product.price,
          quantity: product.quantity++),
    );

    // now check item into cartItems list and increase quantity
    if (cartItems.contains(existingProduct)) {
      existingProduct.quantity++;
    } else {
      cartItems.add(product);
    }

    notifyListeners();
  }

  void removeFromCart(Products product) {
    print("remove from cart");
    Products existingProduct = cartItems.firstWhere(
      (element) => element.name == product.name,
      orElse: () => Products(
          name: product.name,
          price: product.price,
          quantity: product.quantity--),
    );

    // now check item into cartItems list and increase quantity
    if (existingProduct != null) {
      if (existingProduct.quantity > 0) {
        existingProduct.quantity--;

        if (existingProduct.quantity == 0) {
          cartItems.remove(existingProduct);
        }
      }
    }
    // else {
    //   cartItems.remove(product);
    // }

    notifyListeners();
  }
}
