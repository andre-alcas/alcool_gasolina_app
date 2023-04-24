import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();

  String _textoResultado = "";

  void _calcular(){
    // double? precoAlcool = double.tryParse(_controllerAlcool.text);
    // double? precoGasolina = double.tryParse(_controllerGasolina.text);
    // print(_controllerAlcool.text.replaceAll(",", "."));
    // print(_controllerAlcool.text);
    // if(precoAlcool == null || precoGasolina == null){
    //   setState(() {
    //     _textoResultado = "Número inválido, digite números maiores que 0 e utilizando (.)";
    //   });
    // }else{
    //   if((precoAlcool / precoGasolina) >= 0.7){
    //     setState(() {
    //       _textoResultado = "Melhor abastecer com gasolina";
    //     });
    //   }else{
    //     setState(() {
    //       _textoResultado = "Melhor abastecer com alcool";
    //     });
    //   }
    // }
    _controllerAlcool.text = _controllerAlcool.text.replaceAll(",", ".");
    _controllerGasolina.text = _controllerGasolina.text.replaceAll(",", ".");

    double? precoAlcool = double.tryParse(_controllerAlcool.text);
    double? precoGasolina = double.tryParse(_controllerGasolina.text);

    if(precoAlcool == null){
      setState(() {
        _textoResultado = "O preço do álcool está inválido! ";
      });
    }else if(precoGasolina == null) {
      setState(() {
        _textoResultado = "O preço da gasolina está inválido!";
      });
    } else{
      _realizarCalculo(precoAlcool,precoGasolina);
    }
  }

  void _realizarCalculo(double precoAlcool, double precoGasolina){
    if((precoAlcool / precoGasolina) >= 0.7){
      setState(() {
        _textoResultado = "Melhor abastecer com gasolina";
      });
    }else{
      setState(() {
        _textoResultado = "Melhor abastecer com álcool";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset("imagens/logo.png"),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Saiba qual a melhor opção para abastecimento do seu carro",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(labelText: "Preço álcool, ex: 1.59"),
                style: TextStyle(fontSize: 22),
                controller: _controllerAlcool,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(labelText: "Preço Gasolina, ex: 3.59"),
                style: TextStyle(fontSize: 22),
                controller: _controllerGasolina,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                    style:ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(15),
                    ),
                    child: Text(
                      "Calcular",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: _calcular
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  _textoResultado,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
