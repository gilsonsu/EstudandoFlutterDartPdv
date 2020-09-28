import 'package:flutter_pdv/app/database/database_hepler.dart';
import 'package:sqflite/sqflite.dart';

class Product {
  final int id;
  final int subcatgoryId;
  final String barcode;
  final String name;
  final int quatity;
  final String unitatyValue;

  final cnn = new DatabaseHelper();

  Product(
      {this.id,
      this.subcatgoryId,
      this.barcode,
      this.name,
      this.quatity,
      this.unitatyValue});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      "subcatgoryId": subcatgoryId,
      'barcode': barcode,
      'name': name,
      'quatity': quatity,
      'unitaty_value': unitatyValue,
    };
  }

  //-----------------------------------------------------------------------------------------------
  // DAO

  // Insert
  Future<void> save(Product product) async {
    DatabaseHelper dh = new DatabaseHelper();
    var dbClient = await dh.db;

    await dbClient.insert(
      'product',
      product.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Update
  Future<void> alter(Product product) async {
    DatabaseHelper dh = new DatabaseHelper();
    var dbClient = await dh.db;

    await dbClient.update('product', product.toMap(),
        where: "id = ?", whereArgs: [product.id]);
  }

  // Delete
  Future<void> remove(int id) async {
    DatabaseHelper dh = new DatabaseHelper();
    var dbClient = await dh.db;

    await dbClient.delete(
      'product',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  // DAO - Select
  Future<List<Product>> selectAll() async {
    DatabaseHelper dh = new DatabaseHelper();
    var dbClient = await dh.db;

    final List<Map<String, dynamic>> maps = await dbClient.query('product');

    return List.generate(maps.length, (i) {
      return Product(
        id: maps[i]['id'],
        subcatgoryId: maps[i]['category_id'],
        barcode: maps[i]['barcode'],
        name: maps[i]['name'],
        quatity: maps[i]['quantity'],
        unitatyValue: maps[i]['unitity_value'],
      );
    });
  }

  Future<List<Product>> selectOne(int id) async {
    DatabaseHelper dh = new DatabaseHelper();
    var dbClient = await dh.db;

    final List<Map<String, dynamic>> maps =
        await dbClient.rawQuery("SELECT * FROM produto WHERE id = $id ");

    return List.generate(maps.length, (i) {
      return Product(
        id: maps[i]['id'],
        subcatgoryId: maps[i]['category_id'],
        barcode: maps[i]['barcode'],
        name: maps[i]['name'],
        quatity: maps[i]['quantity'],
        unitatyValue: maps[i]['unitity_value'],
      );
    });
  }


  Future<List<Product>> getProductSearch(String name) async {

    DatabaseHelper dh = new DatabaseHelper();
    var dbClient = await dh.db;
    List<Map> list ;

    if(name != '') {
      list = await dbClient.rawQuery(
          "SELECT * FROM product WHERE name LIKE '%$name%' ");
    }else{
      list = await dbClient.rawQuery('SELECT * FROM product');
    }

    List<Product> listProduct = new List();

    for (int i = 0; i < list.length; i++) {
      var product = new Product( id: list[i]['id'],
                        subcatgoryId: list[i]['category_id'],
                        barcode: list[i]['barcode'],
                        name: list[i]['name'],
                        quatity: list[i]['quantity'],
                        unitatyValue: list[i]['unitity_value']
                    );

      listProduct.add(product);
    }
    print(listProduct.length);
    return listProduct;
  }

}
