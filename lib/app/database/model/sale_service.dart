
import 'package:flutter_pdv/app/database/database_hepler.dart';
import 'package:sqflite/sqflite.dart';

class SaleService{

  final int id;
  final int clientId;
  final int serviceId;
  final String totalService;
  final String totalAmount;

  final cnn  = new DatabaseHelper();

  SaleService({this.id, this.clientId, this.serviceId, this.totalService, this.totalAmount});

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      "clientId": clientId,
      "serviceId": serviceId,
      "totalService": totalService,
      "totalAmount": totalAmount
    };
  }

  //-----------------------------------------------------------------------------------------------
  // DAO 

  // Insert
  Future<void> save(SaleService saleService) async {
    DatabaseHelper dh = new DatabaseHelper();
    var dbClient = await dh.db;

    await dbClient.insert('sale_service',
      saleService.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Update
  Future<void> alter(SaleService saleService) async{
    DatabaseHelper dh = new DatabaseHelper();
    var dbClient = await dh.db;

    await dbClient.update(
        'sale_product',
        saleService.toMap(),
        where: "id = ?",
        whereArgs: [saleService.id]
    );
  }

  // Delete
  Future<void> remove(int id) async{
    DatabaseHelper dh = new DatabaseHelper();
    var dbClient = await dh.db;

    await dbClient.delete(
      'sale_service',
       where: "id = ?",
       whereArgs: [id],
    );
  }

  // DAO - Select
  Future<List<SaleService>> selectAll() async{
    DatabaseHelper dh = new DatabaseHelper();
    var dbClient = await dh.db;

    final List<Map<String, dynamic>> maps = await dbClient.query('sale_product');
    
    return List.generate(maps.length, (i) {
      return SaleService(
            id: maps[i]['id'],
            clientId: maps[i]['client_id'],
            serviceId: maps[i]['service_id'],
            totalService: maps[i]['total_service'],
            totalAmount: maps[i]['total_amount'],
      );
    });
  }
  
  Future<List<SaleService>> selectOne(int id) async{
    DatabaseHelper dh = new DatabaseHelper();
    var dbClient = await dh.db;
   
    final List<Map<String, dynamic>> maps = await dbClient.rawQuery("SELECT * FROM sale_service WHERE id = $id ");
    
    return List.generate(maps.length, (i) {
      return SaleService(
        id: maps[i]['id'],
        clientId: maps[i]['client_id'],
        serviceId: maps[i]['service_id'],
        totalService: maps[i]['total_service'],
        totalAmount: maps[i]['total_amount'],
      );
    });
  }
}