// Book - flutter in action - page 63

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdv/app/database/model/ccategory.dart';
import 'package:flutter_pdv/app/database/model/ssubcategory.dart';
import 'package:flutter_pdv/app/list_all.dart';
import 'package:flutter_pdv/app/menu.dart';

class FormSubcategory extends StatefulWidget {

  final SSubcategory subcategory;
  final CCategory category;

  FormSubcategory({this.subcategory, this.category ,Key key}) : super(key: key);

  @override
  _FormSubcategory createState() => _FormSubcategory();
}

class _FormSubcategory extends State<FormSubcategory> {

  // Declaração dos campos do formulário
  final _txtCategory = TextEditingController();
  final _txtSubcategory = TextEditingController();

  //
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _txtCategory.text = widget.category?.name;
    _txtSubcategory.text = widget.subcategory?.name;

    print(widget.category?.id);
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
                  'Subcategoria',
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
                    disabledTextColor: Colors.black,
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    padding: EdgeInsets.all(15.0),
                    splashColor: Colors.orangeAccent,

                    // Call other screen.
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListAll(type: "subcategory",  redirection: "subcategory"),
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

                  //------------------------------------------------------------
                  // Categoria

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _txtCategory,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Categoria',
                      ),
                      onTap:  () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ListAll(type: "category", redirection: "subcategory"),
                          ),
                        );
                      },
                      readOnly: true,
                    ),
                  ),

                  //------------------------------------------------------------
                  // Subcategoria

                  Padding(
                    padding: const EdgeInsets.only(
                        left : 20.0,
                        top : 0.0,
                        right : 20.0,
                        bottom : 20.0 ),
                    child: TextFormField(
                      // autofocus: true,
                      keyboardType: TextInputType.text,
                      controller: _txtSubcategory,
                      decoration: InputDecoration(
                        labelText: "Descrição da Subcategoria",
                        labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                      style: TextStyle(fontSize: 20),
                    ),
                  ),

                  //------------------------------------------------------------
                  // Button Submit

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

    _txtCategory.text = '';
    _txtSubcategory.text = '';

    print('Formulário limpo!');
  }

  void addRecord( ) async {

    print("Id Category - " + widget.category.id.toString() + " Subcategory - " + _txtSubcategory.text );

    var subcategory = new SSubcategory(widget.category.id, _txtSubcategory.text );

    if (widget.subcategory != null) {
      subcategory.setSubcategoryId(widget.subcategory.id);
      await subcategory.update(subcategory);
      print("Alterado com sucesso!");
    } else {
      await subcategory.save(subcategory);
      print("Salvo com sucesso!");
    }
  }



}
