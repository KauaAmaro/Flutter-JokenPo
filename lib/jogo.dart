
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imagemApp = AssetImage("image/padrao.png");
  var _mensagemApp = "Escolha uma opção abaixo";

  void opcaoSelecionada ( String escolhaUsuario){

    var escolhas = ["pedra", "papel", "tesoura"];
    var numeros = Random().nextInt(3);
    var escolhaApp = escolhas[numeros];

    print("Escolha do App: " + escolhaApp);
    print("Escolha do Usuario: " + escolhaUsuario);

    // Alterando a imagem

    switch ( escolhaApp){
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("image/pedra.png");
        });
        break;

      case "papel" :
      setState(() {
      this._imagemApp = AssetImage("image/papel.png");
      });
      break;

      case "tesoura" :
        setState(() {
          this._imagemApp = AssetImage("image/tesoura.png");
        });
        break;
    }

        // validação ganhador
        // usuario venceu

        if(

        (escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel")
    ){
      setState(() {
        this._mensagemApp = "Parabens você ganhou!!";
      });
    } else if (

        (escolhaApp == "pedra" &&  escolhaUsuario== "tesoura") ||
            (escolhaApp == "papel" && escolhaUsuario == "pedra") ||
            (escolhaApp == "tesoura" && escolhaUsuario == "papel")

        ){
          this._mensagemApp = "Você Perdeu!!";

        } else{
          this._mensagemApp = "Empatamos!!";
        }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget> [

          //text
          //imagem
          //text
          //linha de imagem
          Padding(
              padding: EdgeInsets.only( top:32, bottom: 16 ),
           child:   Text("Escolha do App",
                    textAlign: TextAlign.center,
             style: TextStyle(
               fontSize: 20,
               fontWeight: FontWeight.bold,
             ),
           ),
          ),

          Image(image: this._imagemApp,),

          Padding(
            padding: EdgeInsets.only( top:32, bottom: 16 ),
            child:   Text( this._mensagemApp ,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget> [
        GestureDetector(
          onTap: ()=> opcaoSelecionada("pedra"),
          child:  Image.asset("image/pedra.png", height: 100,),
        ),
            GestureDetector(
          onTap: ()=> opcaoSelecionada("papel"),
          child: Image.asset("image/papel.png", height: 100,),
         ),

    GestureDetector(
         onTap: ()=> opcaoSelecionada("tesoura"),
         child: Image.asset("image/tesoura.png", height: 100,) ,
    ),


            ],
          )

        ],
      ),
    );
  }
}
