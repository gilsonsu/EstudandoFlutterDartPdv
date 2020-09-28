
import 'package:flutter_pdv/app/database/database_hepler.dart';
import 'package:sqflite/sqflite.dart';

class Client{

  final int id;
  final String name;
  final String fone;
  final String state;
  final String city;
  final String neighborhood;
  final String address;
  final String landmark;

  final cnn  = new DatabaseHelper();

  Client({
    this.id,
    this.name,
    this.fone,
    this.state,
    this.city,
    this.neighborhood,
    this.address,
    this.landmark });

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'name': name,
      'fone': fone,
      'state': state,
      'city': city,
      'neighborhood': neighborhood,
      'address': address,
      'landmark': landmark
    };
  }

  //-----------------------------------------------------------------------------------------------
  // DAO 

  // Insert
  Future<void> save(Client client) async {
    DatabaseHelper dh = new DatabaseHelper();
    var dbClient = await dh.db;

    await dbClient.insert('client',
      client.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Update
  Future<void> alter(Client client) async{
    DatabaseHelper dh = new DatabaseHelper();
    var dbClient = await dh.db;

    await dbClient.update(
        'client', 
        client.toMap(),
        where: "id = ?",
        whereArgs: [client.id]
    );
  }

  // Delete
  Future<void> remove(int id) async{
    DatabaseHelper dh = new DatabaseHelper();
    var dbClient = await dh.db;

    await dbClient.delete(
      'client',
       where: "id = ?",
       whereArgs: [id],
    );
  }

  // DAO - Select
  Future<List<Client>> selectAll() async{

    DatabaseHelper dh = new DatabaseHelper();
    var dbClient = await dh.db;
   
    final List<Map<String, dynamic>> maps = await dbClient.query('client');
    
    return List.generate(maps.length, (i) {
      return Client(
           id: maps[i]['id'],
           name: maps[i]['name'],
           state: maps[i]['state'],
           city: maps[i]['city'],
           neighborhood: maps[i]['neighborhood'],
           address: maps[i]['address'],
           landmark: maps[i]['landmark']
      );
    });    
  
  }
  
  Future<List<Client>> selectOne(int id) async{

    DatabaseHelper dh = new DatabaseHelper();
    var dbClient = await dh.db;
   
    final List<Map<String, dynamic>> maps = await dbClient.rawQuery("SELECT * FROM client WHERE id = $id ");
    
    return List.generate(maps.length, (i) {
      return Client(
           id: maps[i]['id'],
           name: maps[i]['name'],
           state: maps[i]['state'],
           city: maps[i]['city'],
           neighborhood: maps[i]['neighborhood'],
           address: maps[i]['address'],
           landmark: maps[i]['landmark']
      );
    });    
  
  }


  Future<List<Client>> getClientSearch(String name) async {

    DatabaseHelper dh = new DatabaseHelper();
    var dbClient = await dh.db;
    List<Map> list ;

    if(name != '') {
      list = await dbClient.rawQuery(
          "SELECT * FROM client WHERE name LIKE '%$name%' ");
    }else{
      list = await dbClient.rawQuery('SELECT * FROM client');
    }

    List<Client> listClient = new List();

    for (int i = 0; i < list.length; i++) {
      var client = new Client(id:list[i]["id"],
                              name:list[i]["name"],
                              fone:list[i]['fone'],
                              state:list[i]["state"],
                              city:list[i]["city"],
                              neighborhood:list[i]["city"],
                              address:list[i]["address"],
                              landmark:list[i]["landmark"],
                            );

      listClient.add(client);
    }
    print(listClient.length);
    return listClient;
  }

}