
import 'package:flutter_pdv/app/database/database_hepler.dart';
import 'package:sqflite/sqflite.dart';

class SalePaymentMethod{

  final int id;
  final int saleProductId;
  final int paymentMethodId;
  final String amount;

  final cnn  = new DatabaseHelper();

  SalePaymentMethod({this.id, this.saleProductId, this.paymentMethodId, this.amount});

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      "saleProductId": saleProductId,
      'paymentMethodId': paymentMethodId,
      'amount': amount,
    };
  }

  //-----------------------------------------------------------------------------------------------
  // DAO 

  // Insert
  Future<void> save(SalePaymentMethod salePaymentMethod) async {
    DatabaseHelper dh = new DatabaseHelper();
    var dbClient = await dh.db;

    await dbClient.insert('sale_payment_method',
      salePaymentMethod.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Update
  Future<void> alter(SalePaymentMethod salePaymentMethod) async{
    DatabaseHelper dh = new DatabaseHelper();
    var dbClient = await dh.db;

    await dbClient.update(
        'sale_payment_method',
        salePaymentMethod.toMap(),
        where: "id = ?",
        whereArgs: [salePaymentMethod.id]
    );
  }

  // Delete
  Future<void> remove(int id) async{
    DatabaseHelper dh = new DatabaseHelper();
    var dbClient = await dh.db;

    await dbClient.delete(
      'sale_payment_method',
       where: "id = ?",
       whereArgs: [id],
    );
  }

  // DAO - Select
  Future<List<SalePaymentMethod>> selectAll() async{
    DatabaseHelper dh = new DatabaseHelper();
    var dbClient = await dh.db;

    final List<Map<String, dynamic>> maps = await dbClient.query('sale_payment_method');
    
    return List.generate(maps.length, (i) {
      return SalePaymentMethod(
            id: maps[i]['id'],
            saleProductId: maps[i]['sale_prodoct_id'],
            paymentMethodId: maps[i]['payment_method_id'],
            amount: maps[i]['amount']
      );
    });
  }
  
  Future<List<SalePaymentMethod>> selectOne(int id) async{
    DatabaseHelper dh = new DatabaseHelper();
    var dbClient = await dh.db;
   
    final List<Map<String, dynamic>> maps = await dbClient.rawQuery("SELECT * FROM sale_payment_method WHERE id = $id ");
    
    return List.generate(maps.length, (i) {
      return SalePaymentMethod(
          id: maps[i]['id'],
          saleProductId: maps[i]['sale_prodoct_id'],
          paymentMethodId: maps[i]['payment_method_id'],
          amount: maps[i]['amount']
      );
    });
  }
}