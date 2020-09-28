
import 'package:flutter_pdv/app/database/database_hepler.dart';
import 'package:sqflite/sqflite.dart';

class SaleProduct{

  final int id;
  final int saleId;
  final int productId;
  final String totalItem;
  final String unitityValue;
  final String totalAmount;

  final cnn  = new DatabaseHelper();

  SaleProduct({this.id, this.saleId, this.productId, this.totalItem, this.unitityValue, this.totalAmount});

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      "saleId": saleId,
      "productId": productId,
      "totalItem": totalItem,
      "unitityValue": unitityValue,
      "totalAmount": totalAmount
    };
  }

  //-----------------------------------------------------------------------------------------------
  // DAO 

  // Insert
  Future<void> save(SaleProduct saleProduct) async {
    DatabaseHelper dh = new DatabaseHelper();
    var dbClient = await dh.db;

    await dbClient.insert('sale_product',
      saleProduct.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Update
  Future<void> alter(SaleProduct saleProduct) async{
    DatabaseHelper dh = new DatabaseHelper();
    var dbClient = await dh.db;

    await dbClient.update(
        'sale_product',
        saleProduct.toMap(),
        where: "id = ?",
        whereArgs: [saleProduct.id]
    );
  }

  // Delete
  Future<void> remove(int id) async{
    DatabaseHelper dh = new DatabaseHelper();
    var dbClient = await dh.db;

    await dbClient.delete(
      'sale_product',
       where: "id = ?",
       whereArgs: [id],
    );
  }

  // DAO - Select
  Future<List<SaleProduct>> selectAll() async{
    DatabaseHelper dh = new DatabaseHelper();
    var dbClient = await dh.db;

    final List<Map<String, dynamic>> maps = await dbClient.query('sale_product');
    
    return List.generate(maps.length, (i) {
      return SaleProduct(
            id: maps[i]['id'],
            saleId: maps[i]['sale_id'],
            productId: maps[i]['product_id'],
            totalItem: maps[i]['total_item'],
            unitityValue: maps[i]['unity_value'],
            totalAmount: maps[i]['total_amount'],
      );
    });
  }
  
  Future<List<SaleProduct>> selectOne(int id) async{
    DatabaseHelper dh = new DatabaseHelper();
    var dbClient = await dh.db;
   
    final List<Map<String, dynamic>> maps = await dbClient.rawQuery("SELECT * FROM sale_product WHERE id = $id ");
    
    return List.generate(maps.length, (i) {
      return SaleProduct(
        id: maps[i]['id'],
        saleId: maps[i]['sale_id'],
        productId: maps[i]['product_id'],
        totalItem: maps[i]['total_item'],
        unitityValue: maps[i]['unity_value'],
        totalAmount: maps[i]['total_amount'],
      );
    });
  }
}