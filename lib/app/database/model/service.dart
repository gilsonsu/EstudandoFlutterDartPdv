
import 'package:flutter_pdv/app/database/database_hepler.dart';
import 'package:sqflite/sqflite.dart';

class Service{

  final int id;
  final int subcatgoryId;
  final String name;
  final String cost;

  final cnn  = new DatabaseHelper();

  Service({this.id, this.subcatgoryId, this.name, this.cost});

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      "subcatgoryId": subcatgoryId,
      'name': name,
      'cost': cost,
    };
  }

  //-----------------------------------------------------------------------------------------------
  // DAO 

  // Insert
  Future<void> save(Service service) async {
    DatabaseHelper dh = new DatabaseHelper();
    var dbClient = await dh.db;

    await dbClient.insert('service',
      service.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Update
  Future<void> alter(Service service) async{
    DatabaseHelper dh = new DatabaseHelper();
    var dbClient = await dh.db;

    await dbClient.update(
        'service',
        service.toMap(),
        where: "id = ?",
        whereArgs: [service.id]
    );
  }

  // Delete
  Future<void> remove(int id) async{
    DatabaseHelper dh = new DatabaseHelper();
    var dbClient = await dh.db;

    await dbClient.delete(
      'service',
       where: "id = ?",
       whereArgs: [id],
    );
  }

  // DAO - Select
  Future<List<Service>> selectAll() async{

    DatabaseHelper dh = new DatabaseHelper();
    var dbClient = await dh.db;
   
    final List<Map<String, dynamic>> maps = await dbClient.query('service');
    
    return List.generate(maps.length, (i) {
      return Service(
            id: maps[i]['id'],
            subcatgoryId: maps[i]['category_id'],
            name: maps[i]['name'],
            cost: maps[i]['cost']
      );
    });
  
  }
  
  Future<List<Service>> selectOne(int id) async{

    DatabaseHelper dh = new DatabaseHelper();
    var dbClient = await dh.db;
   
    final List<Map<String, dynamic>> maps = await dbClient.rawQuery("SELECT * FROM service WHERE id = $id ");
    
    return List.generate(maps.length, (i) {
      return Service(
          id: maps[i]['id'],
          subcatgoryId: maps[i]['category_id'],
          name: maps[i]['name'],
          cost: maps[i]['cost']
      );
    });    
  
  }
}