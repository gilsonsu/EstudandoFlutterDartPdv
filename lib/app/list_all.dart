import 'package:flutter/material.dart';
import 'package:flutter_pdv/app/list_client.dart';
import 'package:flutter_pdv/app/list_category_v3.dart';
import 'package:flutter_pdv/app/list_subcategory.dart';
import 'package:flutter_pdv/app/list_product.dart';

class ListAll extends StatefulWidget {

  final String title;
  final String type;
  final String redirection;

  ListAll({Key key, this.title, this.type, this.redirection}) : super(key: key);

  @override
  _ListAll createState() => new _ListAll();
}

class _ListAll extends State<ListAll> {

  String textSearch = "";

  // Declaração dos campos do formulário
  final _name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista'),
        ),
        body: Container(
           child: Column(
             children: <Widget>[


               Padding(
                 padding: const EdgeInsets.only(
                     left : 20.0,
                     top : 0.0,
                     right : 20.0,
                     bottom : 20.0 ),
                 child: TextField(
                   // autofocus: true,
                   keyboardType: TextInputType.text,
                   controller: _name,
                   decoration: InputDecoration(
                     labelText: "Descrição",
                     labelStyle: TextStyle(
                       color: Colors.black38,
                       fontWeight: FontWeight.w400,
                       fontSize: 20,
                     ),
                   ),
                   style: TextStyle(fontSize: 20),
                   onSubmitted: (String str){
                     setState((){
                       textSearch = str;
                     });
                   },

                 ),
               ),

                //--------------------------------------------------------------
                // LIST VIEW
                Expanded(
                  child: typeList(widget.type, widget.redirection),
                )
                // /LIST VIEW
                //--------------------------------------------------------------

            ]
          ),
        ),
    );
  }

  typeList(String type, String redirection){

    if(type == 'client') {
      return ListClient(desc: textSearch,redirection: redirection);
    }

    if(type == 'product') {
      return ListProduct(desc: textSearch,redirection: redirection);
    }

    if(type == 'category') {
      return ListCategoryV3(categoryName: textSearch,redirection: redirection);
    }

    if(type == 'subcategory') {
      return ListSubcategory(subcategoryName: textSearch,redirection: redirection );
    }
  }

}
