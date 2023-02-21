import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './cart.dart';

class OrderItem {
  final String? id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    this.id,
    required this.amount,
    required this.products,
    required this.dateTime,
  });
  Map toJson() => {
        'id': id,
        'amount': amount,
        'products': products,
        'dateTime': dateTime.toIso8601String(),
      };
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];
  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<void> fetchOrders() async {
    final url = Uri.parse(
        'https://myapp-e812d-default-rtdb.europe-west1.firebasedatabase.app/orders.json');

    final response = await http.get(url);
    List<OrderItem> loadedOrders = [];
    final extractedData = json.decode(response.body) as Map<String, dynamic>?;
    if (extractedData == null) {
      return;
    }
    extractedData.forEach((orderId, orderData) {
      loadedOrders.add(
        OrderItem(
            id: orderId,
            amount: orderData['amount'],
            products: (orderData['products'] as List<dynamic>)
                .map((item) => CartItem(
                    id: item['id'],
                    title: item['title'],
                    quantity: item['quantity'],
                    price: item['price']))
                .toList(),
            dateTime: DateTime.parse(orderData['dateTime'])),
      );
    });
    _orders = loadedOrders.reversed.toList();
    notifyListeners();
  }

  Future<void> addOrder(
    List<CartItem> cartProducts,
    double total,
  ) async {
    final timeStamp = DateTime.now();
    final order = OrderItem(
      amount: total,
      dateTime: timeStamp,
      products: cartProducts,
    );
    final url = Uri.parse(
        'https://myapp-e812d-default-rtdb.europe-west1.firebasedatabase.app/orders.json');

    final response = await http.post(url, body: jsonEncode(order));
    _orders.insert(
      0,
      OrderItem(
        id: jsonDecode(response.body)['name'],
        amount: total,
        products: cartProducts,
        dateTime: timeStamp,
      ),
    );
    notifyListeners();
  }
}
