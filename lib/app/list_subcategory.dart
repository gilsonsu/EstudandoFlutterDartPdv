//  https://inducesmile.com/google-flutter/how-to-populate-listview-with-database-in-flutter/
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_pdv/app/database/database_hepler.dart';
import 'package:flutter_pdv/app/database/model/ccategory.dart';
import 'package:flutter_pdv/app/database/model/ssubcategory.dart';
import 'package:flutter_pdv/app/form_subcategory.dart';

class ListSubcategory extends StatefulWidget {

  final String subcategoryName;
  final String redirection;

  ListSubcategory({Key key, this.subcategoryName, this.redirection}) : super(key: key);

  _ListSubcategory createState() => _ListSubcategory();

}

class _ListSubcategory extends State<ListSubcategory> {
  DatabaseHelper db = DatabaseHelper();
  SSubcategory objSubcategory = SSubcategory(null,null);

  //Add data to db

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: FutureBuilder<List>(

        future: objSubcategory.getSubcategorySearch(widget.subcategoryName),

        builder: (context, snapshot) {

          // ListView

          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

          return ListView(
            children: snapshot.data.map((list) => ListTile(

                title: Text(list["name"]),
                subtitle: Text(list["category"]),
                leading: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Text(list["name"][0],
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      )),
                ),
                /*
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      //builder: (context) => FormCategory(idd: category.id),
                      builder: (context) => FormCategory(category: category),

                    ),
                  );
                }*/
                //onTap: () => _test(category)

                onTap: () => redirection(list)
            ))
                .toList(),
          );
        },
      ),
    );

  }

  void redirection(SSubcategory subcategory){

    if(widget.redirection == 'subcategory') {
      Navigator.push(
        context,
        MaterialPageRoute(
          //builder: (context) => FormCategory(idd: category.id),
          builder: (context) => FormSubcategory(subcategory: subcategory),
        ),
      );
    }
  }

  /*
  Future<String> selectCategory(int id) async {

    String value = "Não encontrado! $id ";

    if(id != 0) {
      value += " - aqui";
      CCategory category = new CCategory(null);
      String cat = await category.selectCategory(id);
      print("Look this ->");
      print(cat);
      //value += (result.categoria)?? ' - Nada informado!';
    }

    return value;
  }*/

  selectCategory(int id ){

    String ctgName =  "";

    /*
    if(id !=0) {
      CCategory category = new CCategory(null);
      Future<String> categoryName = category.selectCategory(id);
      categoryName.then((value) {
        //ctgName =  value;
        ctgName = " - Pica grossa!";
      });
    }
    */

    //return ctgName;
    return "Era para aperecer alguma coisa, acredito eu! $ctgName ";
  }

}