# Consumo de API Http Flutter

para iniciar a utilização de consumo de APIs é necessário adicionar a dependência http no  arquivo pubspec.yaml e adicionar a versão, neste caso estou usando a versão 0.12
```
dependencies:
http: ^0.12.0+1
```

Após essa alteração já podemos importar a biblioteca responsável por obter os dados e fazer as conexões entre o nosso APP e o JSON Web que iremos consumir. Também podemos definir uma rota para essa biblioteca. O convert  é para conseguimos converter o objeto JSON em uma matriz.
```
import 'package:http/http.dart' as http;
import 'dart:convert';
```

Definimos um método Async  (assíncrono), ou seja, não teremos uma comunicação instantânea e ao utilizarmos o método get.url() deveremos usar o await para sinalizar que esperaremos até ser fornecido os dados
```
class _HomeState extends State<Home> { 
  _recuperarCep() async { 
    String url = "https://viacep.com.br/ws/04457140/json/"; 
    http.Response response; 
    response = await http.get(url); 
}
```

Definindo valores com os mesmos nomes que o JSON já podemos obter esses dados em forma de String

JSON fornecido
```
{ 
  "cep": "04457-140", 
  "logradouro": "Rua Constantino Sergio", 
  "complemento": "", 
  "bairro": "Jardim Palmares (Zona Sul)", 
  "localidade": "São Paulo", 
  "uf": "SP", 
  "ibge": "3550308", 
  "gia": "1004", 
  "ddd": "11", 
  "siafi": "7107" 
}
```

Mapeamento
```
Map<String, dynamic> retorno = json.decode(response.body); 
    String logradouro = retorno["logradouro"]; 
    String complemento = retorno["complemento"]; 
    String bairro = retorno["bairro"]; 
    String localidade = retorno["localidade"];
```

# Consumo de API HTTP usando o Future

Antes do "Widget Build" iniciar um Map do Tipo Future, que sinalizar que o programa recebera dados futuros.
```
 Future<Map> _recuperarPreco() async {
    String url = "https://blockchain.info/ticker";
    http.Response response = await http.get(url);
    return json.decode( response.body );
  }
  
```
Após isso, dentro do Widget Build retornar FutureBuilder e usar os dois parametros obrigatorios: <span style="color:#FF5733;">future</span>, que deve adicionar o nome da função que esta o Future. O Builder tem que ser passado uma função (pode ser anonima), passando o context e o snapshot, o snapshot vai ser usado para manipular os dados, utilizando um Switch para controlar os tempos.

```
future: _recuperarPreco(),
builder: (context, snapshot){}
```
