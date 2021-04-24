import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

    
    TextEditingController _cepUser = TextEditingController();
    String _resultado = "Resultado";
  _recuperarCep() async {

    
    String cep = _cepUser.text;
    String url = "https://viacep.com.br/ws/$cep/json/";
    http.Response response;

    response = await http.get(url);
    Map<String, dynamic> retorno = json.decode(response.body);
    String logradouro = retorno["logradouro"];
    String complemento = retorno["complemento"];
    String bairro = retorno["bairro"];


    setState(() {
          _resultado = "$logradouro, $complemento, $bairro";
        });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de serviço web"),
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Digite um CEP"
              ),
              style: TextStyle(
                fontSize: 20
              ),
              controller: _cepUser,
            ),
            
            RaisedButton(
              child: Text("Clique aqui"),
              onPressed: _recuperarCep,
            ),

            Text(_resultado),
          ],
        ),
      ),

    );
  }
}