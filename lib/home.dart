import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:my_app/models/product.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> produtos = [];

  Future<List<Product>> _getProducts() async {
    String api = 'https://example-ecommerce.herokuapp.com/product/list';
    var response = await get(
      Uri.parse(api),
      headers: <String, String>{'Content-Type': 'application/json'},
    );

    final objJson = json.decode(response.body) as List;

    print(objJson);

    return objJson.map((object) => Product.fromJson(object)).toList();
  }

  @override
  void initState() {
    super.initState();
    _getProducts().then((list) {
      setState(() {
        produtos = list;
      });
    });
    print(produtos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Produtos')),
        body: ListView.separated(
            itemBuilder: (BuildContext context, int produto) {
              return ListTile(
                title: Text(produtos[produto].name),
                subtitle: Text(produtos[produto].factory.name),
                trailing: Text(produtos[produto].price.toString()),
              );
            },
            padding: EdgeInsets.all(16),
            separatorBuilder: (_, ___) => Divider(),
            itemCount: produtos.length));
  }
}
