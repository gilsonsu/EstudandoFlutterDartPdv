//  https://inducesmile.com/google-flutter/how-to-populate-listview-with-database-in-flutter/

import 'package:flutter/material.dart';

import 'package:flutter_pdv/app/database/database_hepler.dart';
import 'package:flutter_pdv/app/database/model/ccategory.dart';
import 'package:flutter_pdv/app/form_category.dart';
import 'package:flutter_pdv/app/form_subcategory.dart';
import 'package:flutter_pdv/app/form_product.dart';

class ListCategoryV3 extends StatefulWidget {

  final String categoryName;
  final String redirection;

  ListCategoryV3({Key key, this.categoryName, this.redirection}) : super(key: key);

  _ListCategoryV3 createState() => _ListCategoryV3();

}

class _ListCategoryV3 extends State<ListCategoryV3> {
  DatabaseHelper db = DatabaseHelper();
  CCategory objCategory = CCategory(null);

  //Add data to db

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: FutureBuilder<List<CCategory>>(

        future: objCategory.getCategorySearch(widget.categoryName) ,

        builder: (context, snapshot) {


          // ListView

          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

          return ListView(
            children: snapshot.data.map((category) => ListTile(

                title: Text(category.name),
                subtitle: Text(category.name),
                leading: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Text(category.name[0],
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

                onTap: () => redirection(category)
            ))
                .toList(),
          );
        },
      ),
    );

  }

  void redirection(CCategory category){

    // Category redirect
    if(widget.redirection == 'category') {
      Navigator.push(
        context,
        MaterialPageRoute(
          //builder: (context) => FormCategory(idd: category.id),
          builder: (context) => FormCategory(category: category),
        ),
      );
    }

    // Subcategory
    if(widget.redirection == 'subcategory') {
      Navigator.push(
        context,
        MaterialPageRoute(
          //builder: (context) => FormCategory(idd: category.id),
          builder: (context) => FormSubcategory(category: category),
        ),
      );
    }

    // Product
    if(widget.redirection == 'product') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FormProduct(category: category),
        ),
      );
    }
  }
}