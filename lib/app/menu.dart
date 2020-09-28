import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_pdv/app/form_client.dart';
import 'package:flutter_pdv/app/form_product.dart';
import 'package:flutter_pdv/app/form_service.dart';
import 'package:flutter_pdv/app/form_category.dart';
import 'package:flutter_pdv/app/form_subcategory.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title = 'ahhahaha'}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
      child: SingleChildScrollView(
        child:Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[

            Padding(
              padding: const EdgeInsets.only(
                  left : 20.0,
                  top : 30.0,
                  right : 20.0,
                  bottom : 10.0 ),
              child: SizedBox(
                width: 128,
                height: 128,
                child: Image.asset("assets/logo.png"),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
              child: Text(
                'Gerenciamento de Vendas e Serviços via Celular',
                 style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 24,
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
              child: Text(
                'Controle todas as vendas de sua loja usando o celular, tonarndo fácil suas atividades!',
                style: TextStyle(fontSize: 20.0,
                    fontWeight: FontWeight.normal
                ),
              ),
            ),

            // -----------------------------------------------------------------
            // Menu de Lançamento
            // -----------------------------------------------------------------

            Column(
              children: <Widget>[

                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                  child: Text('Lançamento',
                      style:  TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 24,
                      ) ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                    left : 20.0,
                    top : 0.0,
                    right : 20.0,
                    bottom : 10.0 ),

                  child: FlatButton(
                    color: Colors.orange,
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.all(15.0),
                    splashColor: Colors.orangeAccent,

                    onPressed: () {
                      /*...*/
                    },
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Lançar Vendas",
                        style: TextStyle(fontSize: 20.0,
                            fontWeight: FontWeight.normal
                        ),
                          textAlign: TextAlign.left
                      ),
                    )
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.only(
                      left : 20.0,
                      top : 0.0,
                      right : 20.0,
                      bottom : 10.0 ),

                  child: FlatButton(
                      color: Colors.orange,
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(15.0),
                      splashColor: Colors.orangeAccent,

                      onPressed: () {
                        /*...*/
                      },
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                            "Lançamentos do Dia",
                            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal),
                            textAlign: TextAlign.left
                        ),
                      )
                  ),
                ),



              ],
            ),

            // -----------------------------------------------------------------
            // Menu de cadastro
            // -----------------------------------------------------------------

            Column(
              children: <Widget>[

                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                  child: Text('Cadastros / Pesquisas',
                      style:  TextStyle(
                      color: Colors.blueAccent,
                         fontSize: 24,
                      ) ),
                ),


                Padding(
                  padding: const EdgeInsets.only(
                      left : 20.0,
                      top : 0.0,
                      right : 20.0,
                      bottom : 10.0 ),
                  child: FlatButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(15.0),
                      splashColor: Colors.blueAccent,

                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FormClient(),
                          ),
                        );
                      },

                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                            "Cliente",
                            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal),
                            textAlign: TextAlign.left
                        ),
                      )
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                      left : 20.0,
                      top : 0.0,
                      right : 20.0,
                      bottom : 10.0 ),
                  child: FlatButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(15.0),
                      splashColor: Colors.blueAccent,

                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FormProduct(),
                          ),
                        );
                      },
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                            "Produto",
                            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal),
                            textAlign: TextAlign.left
                        ),
                      )
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                      left : 20.0,
                      top : 0.0,
                      right : 20.0,
                      bottom : 10.0 ),
                  child: FlatButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(15.0),
                      splashColor: Colors.blueAccent,

                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FormService(),
                          ),
                        );
                      },
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                            "Serviços",
                            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal),
                            textAlign: TextAlign.left
                        ),
                      )
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                      left : 20.0,
                      top : 0.0,
                      right : 20.0,
                      bottom : 10.0 ),
                  child: FlatButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(15.0),
                      splashColor: Colors.blueAccent,

                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FormCategory(),
                          ),
                        );
                      },
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                            "Categoria",
                            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal),
                            textAlign: TextAlign.left
                        ),
                      )
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                      left : 20.0,
                      top : 0.0,
                      right : 20.0,
                      bottom : 10.0 ),
                  child: FlatButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(15.0),
                      splashColor: Colors.blueAccent,

                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FormSubcategory(),
                          ),
                        );
                      },
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                            "Subcategoria",
                            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal),
                            textAlign: TextAlign.left
                        ),
                      )
                  ),
                ),


                // TITULO DE RELATORIO

                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                  child: Text('Relatórios',
                      style:  TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 24,
                      ) ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                      left : 20.0,
                      top : 0.0,
                      right : 20.0,
                      bottom : 10.0 ),

                  child: FlatButton(
                      color: Colors.green,
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(15.0),
                      splashColor: Colors.greenAccent,

                      onPressed: () {
                        /*...*/
                      },
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                            "Movimento do Dia Resumido",
                            style: TextStyle(fontSize: 20.0,
                                fontWeight: FontWeight.normal
                            ),
                            textAlign: TextAlign.left
                        ),
                      )
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.only(
                      left : 20.0,
                      top : 0.0,
                      right : 20.0,
                      bottom : 10.0 ),

                  child: FlatButton(
                      color: Colors.green,
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(15.0),
                      splashColor: Colors.greenAccent,

                      onPressed: () {
                        /*...*/
                      },
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                            "Movimento do Dia Detalhando ",
                            style: TextStyle(fontSize: 20.0,
                                fontWeight: FontWeight.normal
                            ),
                            textAlign: TextAlign.left
                        ),
                      )
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                      left : 20.0,
                      top : 0.0,
                      right : 20.0,
                      bottom : 10.0 ),

                  child: FlatButton(
                      color: Colors.green,
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(15.0),
                      splashColor: Colors.greenAccent,

                      onPressed: () {
                        /*...*/
                      },
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                            "Movimento do Por Data Resumido",
                            style: TextStyle(fontSize: 20.0,
                                fontWeight: FontWeight.normal
                            ),
                            textAlign: TextAlign.left
                        ),
                      )
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                      left : 20.0,
                      top : 0.0,
                      right : 20.0,
                      bottom : 10.0 ),

                  child: FlatButton(
                      color: Colors.green,
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(15.0),
                      splashColor: Colors.greenAccent,

                      onPressed: () {
                        /*...*/
                      },
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                            "Movimento do Por Data Detalhado",
                            style: TextStyle(fontSize: 20.0,
                                fontWeight: FontWeight.normal
                            ),
                            textAlign: TextAlign.left
                        ),
                      )
                  ),
                ),


              ],
            ),

            // -----------------------------------------------------------------
            // MEU DE RELATÓRIO
            // -----------------------------------------------------------------




          ],
        ),

      ),
      ),
    );
  }
}
