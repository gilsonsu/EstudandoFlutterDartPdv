// Book - flutter in action - page 63

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdv/app/database/model/client.dart';
import 'package:flutter_pdv/app/list_all.dart';
import 'package:flutter_pdv/app/menu.dart';

class FormClient extends StatefulWidget {

  final Client client;

  FormClient({this.client ,Key key}) : super(key: key);

  @override
  _FormClient createState() => _FormClient();
}

class _FormClient extends State<FormClient> {

  // Declaração dos campos do formulário
  final _txtName = TextEditingController();
  final _txtFone = TextEditingController();
  final _txtState = TextEditingController();
  final _txtCity = TextEditingController();
  final _txtNeighborhood = TextEditingController();
  final _txtAddress = TextEditingController();
  final _txtLandmark = TextEditingController();


  //
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _txtName.text = widget.client?.name;
    _txtFone.text = widget.client?.fone;
    _txtState.text = widget.client?.state;
    _txtCity.text = widget.client?.city;
    _txtNeighborhood.text = widget.client?.neighborhood;
    _txtAddress.text = widget.client?.address;
    _txtLandmark.text = widget.client?.landmark;
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
                  'Cliente',
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
                          builder: (context) => ListAll(type: "client",  redirection: "client"),
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

                  // Client - Name
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

                  // Client - Fone

                  Padding(
                    padding: const EdgeInsets.only(
                        left : 20.0,
                        top : 0.0,
                        right : 20.0,
                        bottom : 20.0 ),
                    child: TextFormField(
                      // autofocus: true,
                      keyboardType: TextInputType.text,
                      controller: _txtFone,
                      decoration: InputDecoration(
                        labelText: "Fone",
                        labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                      style: TextStyle(fontSize: 20),
                    ),
                  ),

                  // Client - Location

                  Padding(
                    padding: const EdgeInsets.only(
                        left : 20.0,
                        top : 0.0,
                        right : 20.0,
                        bottom : 20.0 ),
                    child: TextFormField(
                      // autofocus: true,
                      keyboardType: TextInputType.text,
                      controller: _txtState,
                      decoration: InputDecoration(
                        labelText: "Estado",
                        labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                      style: TextStyle(fontSize: 20),
                    ),
                  ),

                  // Client - City

                  Padding(
                    padding: const EdgeInsets.only(
                        left : 20.0,
                        top : 0.0,
                        right : 20.0,
                        bottom : 20.0 ),
                    child: TextFormField(
                      // autofocus: true,
                      keyboardType: TextInputType.text,
                      controller: _txtCity,
                      decoration: InputDecoration(
                        labelText: "Cidade",
                        labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                      style: TextStyle(fontSize: 20),
                    ),
                  ),

                  // Client - Neighborhood

                  Padding(
                    padding: const EdgeInsets.only(
                        left : 20.0,
                        top : 0.0,
                        right : 20.0,
                        bottom : 20.0 ),
                    child: TextFormField(
                      // autofocus: true,
                      keyboardType: TextInputType.text,
                      controller: _txtNeighborhood,
                      decoration: InputDecoration(
                        labelText: "Bairro",
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
                        bottom : 20.0 ),
                    child: TextFormField(
                      // autofocus: true,
                      keyboardType: TextInputType.text,
                      controller: _txtAddress,
                      decoration: InputDecoration(
                        labelText: "Endereço",
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
                        bottom : 20.0 ),
                    child: TextFormField(
                      // autofocus: true,
                      keyboardType: TextInputType.text,
                      controller: _txtLandmark,
                      decoration: InputDecoration(
                        labelText: "Ponto de Referência",
                        labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                      style: TextStyle(fontSize: 20),
                    ),
                  ),

                  // Button = Submit
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

    _txtName.text = '';
    _txtFone.text = '';
    _txtState.text = '';
    _txtCity.text = '';
    _txtNeighborhood.text = '';
    _txtAddress.text = '';
    _txtLandmark.text = '';

    print('Formulário limpo!');
  }

  void addRecord( ) async {
    var client = new Client(
                            id: widget.client?.id,
                            name:_txtName.text,
                            fone:_txtFone.text,
                            state:_txtState.text,
                            city:_txtCity.text,
                            neighborhood: _txtNeighborhood.text,
                            address: _txtAddress.text,
                            landmark: _txtLandmark.text
                            );
    
    if (widget.client != null) {
      await client.alter(client);
      print("Alterado com sucesso!");
    } else {
      await client.save(client);
      print("Salvo com sucesso!");
    }
  }

}
