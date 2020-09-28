//  https://inducesmile.com/google-flutter/how-to-populate-listview-with-database-in-flutter/
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_pdv/app/database/database_hepler.dart';
import 'package:flutter_pdv/app/database/model/product.dart';
import 'package:flutter_pdv/app/form_product.dart';

class ListProduct extends StatefulWidget {

  final String desc;
  final String redirection;

  ListProduct({Key key, this.desc, this.redirection}) : super(key: key);

  _ListProduct createState() => _ListProduct();

}

class _ListProduct extends State<ListProduct> {
  DatabaseHelper db = DatabaseHelper();
  Product objProduct = Product();

  //Add data to db

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: FutureBuilder<List<Product>>(

        future: objProduct.getProductSearch(widget.desc),

        builder: (context, snapshot) {

          // ListView

          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

          return ListView(
            children: snapshot.data.map((list) => ListTile(

                title: Text(list.name),
                subtitle: Text(list.name),
                leading: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Text(list.name[0],
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      )),
                ),

                onTap: () => redirection(list)
            ))
                .toList(),
          );
        },
      ),
    );

  }

  void redirection(Product product){
    if(widget.redirection == 'product') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FormProduct(product: product),
        ),
      );
    }
  }

}