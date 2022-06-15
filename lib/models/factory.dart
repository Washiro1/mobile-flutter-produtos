import 'package:flutter/foundation.dart';

class Factory {
  int id;
  String name;

  Factory({required this.id, required this.name});

  factory Factory.fromJson(dynamic json) {
    return Factory(id: json['id'] as int, name: json['name']);
  }
}
