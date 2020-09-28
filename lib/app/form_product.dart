// Book - flutter in action - page 63

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdv/app/database/model/product.dart';
import 'package:flutter_pdv/app/database/model/ccategory.dart';
import 'package:flutter_pdv/app/database/model/ssubcategory.dart';
import 'package:flutter_pdv/app/list_all.dart';
import 'package:flutter_pdv/app/menu.dart';

class FormProduct extends StatefulWidget {
  //final int idd;
  //FormProduct({this.idd, Key key}) : super(key: key);

  final Product product;
  final CCategory category;
  final SSubcategory subcategory;

  FormProduct({this.product, this.category, this.subcategory ,Key key}) : super(key: key);

  @override
  _FormProduct createState() => _FormProduct();
}

class _FormProduct extends State<FormProduct> {

  // Declaração dos campos do formulário
  final _txtCategory = TextEditingController();
  final _txtSubcategory = TextEditingController();
  final _txtBarcode = TextEditingController();
  final _txtName = TextEditingController();
  final _txtQuatity = TextEditingController();
  final _txtUnitatyValue = TextEditingController();

  //
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _txtCategory.text = widget.category?.name;
    _txtSubcategory.text = widget.subcategory?.name;
    _txtBarcode.text = widget.product?.barcode;
    _txtName.text = widget.product?.name;
    _txtQuatity.text = widget.product?.
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
                  'Produto',
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
                         // builder: (context) => ListCategory(),
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

              Column(
                children: <Widget>[

                  //
                  //
                  // input category
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
                            builder: (context) => ListAll(type: "category", redirection: "product"),
                          ),
                        );
                      },
                      readOnly: true,
                    ),
                  ),

                  //
                  //
                  // input subcategory
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
                        labelText: "Subcategoria",
                        labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                      style: TextStyle(fontSize: 20),
                    ),
                  ),

                  //
                  //
                  // input barcode
                  Padding(
                    padding: const EdgeInsets.only(
                        left : 20.0,
                        top : 0.0,
                        right : 20.0,
                        bottom : 20.0 ),
                    child: TextFormField(
                      // autofocus: true,
                      keyboardType: TextInputType.text,
                      controller: _txtBarcode,
                      decoration: InputDecoration(
                        labelText: "Código de Barras",
                        labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                      style: TextStyle(fontSize: 20),
                    ),
                  ),

                  //
                  //
                  // input name
                  Padding(
                    padding: const EdgeInsets.only(
                        left : 20.0,
                        top : 0.0,
                        right : 20.0,
                        bottom : 20.0 ),
                    child: TextFormField(
                      // autofocus: true,
                      keyboardType: TextInputType.text,
                      controller: _txtName,
                      decoration: InputDecoration(
                        labelText: "Nome",
                        labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                      style: TextStyle(fontSize: 20),
                    ),
                  ),

                  //
                  //
                  // input unitaty value
                  Padding(
                    padding: const EdgeInsets.only(
                        left : 20.0,
                        top : 0.0,
                        right : 20.0,
                        bottom : 20.0 ),
                    child: TextFormField(
                      // autofocus: true,
                      keyboardType: TextInputType.text,
                      controller: _txtUnitatyValue,
                      decoration: InputDecoration(
                        labelText: "Valor",
                        labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                      style: TextStyle(fontSize: 20),
                    ),
                  ),

                  //
                  //
                  // input quatity
                  Padding(
                    padding: const EdgeInsets.only(
                        left : 20.0,
                        top : 0.0,
                        right : 20.0,
                        bottom : 20.0 ),
                    child: TextFormField(
                      // autofocus: true,
                      keyboardType: TextInputType.text,
                      controller: _txtQuatity,
                      decoration: InputDecoration(
                        labelText: "Qtd. no Estoque",
                        labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                      style: TextStyle(fontSize: 20),
                    ),
                  ),

                  //
                  //
                  // button save
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void newRecord(){

    //_name.text = '';
    print('Formulário limpo!');
  }


  void addRecord( ) async {

    var product = new Product(
      id: widget.product?.id,
      subcatgoryId: widget.subcategory?.id,
      barcode: _txtBarcode.text,
      name: _txtName.text,
      quatity: _txtQuatity.text,
      unitatyValue: _txtUnitatyValue.text
    );

    if (widget.product != null) {
      await product.alter(product);
      print("Alterado com sucesso!");
    } else {
      await product.save(product);
      print("Salvo com sucesso!");
    }
  }

}
