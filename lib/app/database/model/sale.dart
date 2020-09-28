
import 'package:flutter_pdv/app/database/database_hepler.dart';
import 'package:sqflite/sqflite.dart';

class Sale{

  final int id;
  final int clientId;
  final int totalItem;
  final String totalAmount;
  final String dataSale;

  final cnn  = new DatabaseHelper();

  Sale({this.id, this.clientId, this.totalItem, this.totalAmount, this.dataSale});

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      "clientId": clientId,
      'totalItem': totalItem,
      'dataSale': dataSale,
    };
  }

  //-----------------------------------------------------------------------------------------------
  // DAO 

  // Insert
  Future<void> save(Sale sale) async {
    DatabaseHelper dh = new DatabaseHelper();
    var dbClient = await dh.db;

    await dbClient.insert('sale',
      sale.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Update
  Future<void> alter(Sale sale) async{
    DatabaseHelper dh = new DatabaseHelper();
    var dbClient = await dh.db;

    await dbClient.update(
        'sale',
        sale.toMap(),
        where: "id = ?",
        whereArgs: [sale.id]
    );
  }

  // Delete
  Future<void> remove(int id) async{
    DatabaseHelper dh = new DatabaseHelper();
    var dbClient = await dh.db;

    await dbClient.delete(
      'sale',
       where: "id = ?",
       whereArgs: [id],
    );
  }

  // DAO - Select
  Future<List<Sale>> selectAll() async{

    DatabaseHelper dh = new DatabaseHelper();
    var dbClient = await dh.db;
   
    final List<Map<String, dynamic>> maps = await dbClient.query('service');
    
    return List.generate(maps.length, (i) {
      return Sale(
            id: maps[i]['id'],
            clientId: maps[i]['client_id'],
            totalItem: maps[i]['total_item'],
            totalAmount: maps[i]['total_amount'],
            dataSale: maps[i]['data_sale']
      );
    });
  
  }
  
  Future<List<Sale>> selectOne(int id) async{

    DatabaseHelper dh = new DatabaseHelper();
    var dbClient = await dh.db;
   
    final List<Map<String, dynamic>> maps = await dbClient.rawQuery("SELECT * FROM sale WHERE id = $id ");
    
    return List.generate(maps.length, (i) {
      return Sale(
          id: maps[i]['id'],
          clientId: maps[i]['client_id'],
          totalItem: maps[i]['total_item'],
          totalAmount: maps[i]['total_amount'],
          dataSale: maps[i]['data_sale']
      );
    });    
  
  }
}