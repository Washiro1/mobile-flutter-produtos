import 'package:my_app/models/factory.dart';

class Product {
  int amount;
  Factory factory;
  int id;
  String name;
  double price;

  Product(
      {required this.amount,
      required this.factory,
      required this.id,
      required this.name,
      required this.price});

  factory Product.fromJson(Map json) {
    return Product(
        amount: json['amount'],
        factory: Factory.fromJson(json['factory']),
        id: json['id'],
        name: json['name'],
        price: json['price']);
  }
}
