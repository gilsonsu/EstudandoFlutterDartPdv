// Book - flutter in action - page 63

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_pdv/app/database/model/ccategory.dart';
import 'package:flutter_pdv/app/list_all.dart';
import 'package:flutter_pdv/app/menu.dart';

class FormCategory extends StatefulWidget {
   //final int idd;
  //FormCategory({this.idd, Key key}) : super(key: key);

  final CCategory category;

  FormCategory({this.category ,Key key}) : super(key: key);

  @override
  _FormCategory createState() => _FormCategory();
}

class _FormCategory extends State<FormCategory> {

  // Declaração dos campos do formulário
  final _name = TextEditingController();

  //
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //print("Puta que pariu meu brow: ${widget.idd} ");
    //print("Que loucura meu brow ${widget.category.id} - ${widget.category.name}");

    _name.text = widget.category?.name;

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('PDV Fácil'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child:Column(

            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[

              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                child: Text(
                  'Categoria',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 24,
                  ),
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

                    // Call function.
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyHomePage(),
                        ),
                      );
                    },

                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                          "Menu Principal",
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
                    color: Colors.orange,
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.all(15.0),
                    splashColor: Colors.orangeAccent,

                    // Call function.
                    onPressed: newRecord,

                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                          "Novo Cadastro",
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
                    color: Colors.orange,
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.all(15.0),
                    splashColor: Colors.orangeAccent,

                    // Call other screen.
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListAll(type: "category",  redirection: "category"),
                        ),
                      );
                    },

                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                          "Lista de Cadastros",
                          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal),
                          textAlign: TextAlign.left
                      ),
                    )
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

              // ---------------------------------------------------------------
              // Menu de Lançamento
              // ---------------------------------------------------------------

              Column(
                children: <Widget>[

                  Padding(
                    padding: const EdgeInsets.only(
                        left : 20.0,
                        top : 0.0,
                        right : 20.0,
                        bottom : 20.0 ),
                    child: TextFormField(
                      // autofocus: true,
                      keyboardType: TextInputType.text,
                      controller: _name,
                      decoration: InputDecoration(
                        labelText: "Descrição da Categoria",
                        labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                      style: TextStyle(fontSize: 20),
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
                        onPressed: addRecord ,
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                              "Salvar",
                              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal),
                              textAlign: TextAlign.center
                          ),
                        )
                    ),
                  ),

                  // -----------------------------------------------------------
                  // -----------------------------------------------------------

                ],
              ),

              // ---------------------------------------------------------------
              // ---------------------------------------------------------------

            ],
          ),

          // -------------------------------------------------------------------
          // -------------------------------------------------------------------

        ),
      ),
    );

  }

  void newRecord(){
    
    _name.text = '';
    print('Formulário limpo!');
  }

  void addRecord( ) async {

    var category = new CCategory(_name.text);

    if (widget.category != null) {
      category.setCategoryId(widget.category.id);
      await category.update(category);
      print("Alterado com sucesso!");
    } else {
      await category.save(category);
      print("Salvo com sucesso!");
    }
   // print('TESTE DE CADASTRO');
   // await db.saveCategory(category);
  }



}
