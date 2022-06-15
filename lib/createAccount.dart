import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'home.dart';

class CreateAccountPage extends StatefulWidget {
  CreateAccountPage({Key? key}) : super(key: key);

  final String title = 'Criar Conta';

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  String _adress = '';
  dynamic _age = 0;
  String _email = '';
  String _name = '';
  String _userPassword = '';

  Future<void> send() async {
    String api = 'https://example-ecommerce.herokuapp.com/user/customer/add';

    Response response = await post(Uri.parse(api),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(<String, dynamic>{
          'address': _adress,
          'age': _age,
          'email': _email,
          'name': _name,
          'userPassword': _userPassword,
        }));

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 201) {
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                content: const Text('Falha ao criar conta'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Voltar'),
                    child: const Text('Voltar'),
                  )
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: TextFormField(
                  onChanged: (text) {
                    setState(() {
                      _adress = text;
                    });
                  },
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Informe o endereço:'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: TextFormField(
                  onChanged: (text) {
                    setState(() {
                      _age = text;
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Informe a idade:'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: TextFormField(
                  onChanged: (text) {
                    setState(() {
                      _email = text;
                    });
                  },
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Informe o e-mail:'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: TextFormField(
                  onChanged: (text) {
                    setState(() {
                      _name = text;
                    });
                  },
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Informe o nome:'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: TextFormField(
                  onChanged: (text) {
                    setState(() {
                      _userPassword = text;
                    });
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Informe a senha:'),
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: TextButton(
                    onPressed: () {
                      send();
                    },
                    child: Text('Enviar'),
                  ))
            ]),
      ),
    );
  }
}
