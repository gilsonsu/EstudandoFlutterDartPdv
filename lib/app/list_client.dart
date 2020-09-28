//  https://inducesmile.com/google-flutter/how-to-populate-listview-with-database-in-flutter/
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_pdv/app/database/database_hepler.dart';
import 'package:flutter_pdv/app/database/model/client.dart';
import 'package:flutter_pdv/app/form_client.dart';

class ListClient extends StatefulWidget {

  final String desc;
  final String redirection;

  ListClient({Key key, this.desc, this.redirection}) : super(key: key);

  _ListClient createState() => _ListClient();

}

class _ListClient extends State<ListClient> {
  DatabaseHelper db = DatabaseHelper();
  Client objClient = Client();

  //Add data to db

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: FutureBuilder<List<Client>>(

        future: objClient.getClientSearch(widget.desc),

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

  void redirection(Client client){
    if(widget.redirection == 'client') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FormClient(client: client),
        ),
      );
    }
  }

}