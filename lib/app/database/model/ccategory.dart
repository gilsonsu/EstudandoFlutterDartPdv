
import 'package:flutter/cupertino.dart';
import 'package:flutter_pdv/app/database/database_hepler.dart';

class CCategory {

  int id;
  String _name;
  String _type;

  CCategory(this._name) ;

  CCategory.map(dynamic obj) {

    this._name = obj["name"];
    this._type = obj["type"];

  }

  // Get
  String get name => _name;
  String get type => _type;

  // Set
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    map["name"] = _name;
    map["type"] = _type;

    return map;
  }

  void setCategoryId(int id) {
    this.id = id;
  }

    //----------------------------------------------------------------------------
    // Dao

    Future<int> save(CCategory category) async {

      DatabaseHelper dh = new DatabaseHelper();
      var dbClient = await dh.db;
      int res = await dbClient.insert("category", category.toMap());
      print('aqui!!!');
      print(res);
      return res;
    }

    Future<int> delete(CCategory category) async {

      DatabaseHelper dh = new DatabaseHelper();
      var dbClient = await dh.db;

      int res =
      await dbClient.rawDelete('DELETE FROM category WHERE id = ?', [category.id]);
      return res;
    }

    Future<bool> update(CCategory category) async {

      DatabaseHelper dh = new DatabaseHelper();
      var dbClient = await dh.db;

      int res =   await dbClient.update("category", category.toMap(),
          where: "id = ?", whereArgs: <int>[category.id]);

      return res > 0 ? true : false;
    }

  //----------------------------------------------------------------------------
  // Dao - Select

  // 20200325
   Future<String> selectCategory(int id) async {

    DatabaseHelper dh = new DatabaseHelper();
    var dbClient = await dh.db;

    List<Map> list = await dbClient.rawQuery('SELECT * FROM category WHERE id = $id');
    print("Resulta da pesquisa");
    print(list[0]["name"]);

    return list[0]["name"];
  }

  /*
  getClient(int id) async {
    final db = await database;
    var res =await  db.query("Client", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Client.fromMap(res.first) : Null ;
  }
  */

  Future<List<CCategory>> getCategory2() async {

    DatabaseHelper dh = new DatabaseHelper();
    var dbClient = await dh.db;

    List<Map> list = await dbClient.rawQuery('SELECT * FROM category');
    List<CCategory> listCategory = new List();

    for (int i = 0; i < list.length; i++) {
      var category = new CCategory(list[i]["name"]);
      category.setCategoryId(list[i]["id"]);
      listCategory.add(category);
    }
    print(listCategory.length);
    return listCategory;
  }

  Future<List<CCategory>> getCategorySearch(String name) async {

    DatabaseHelper dh = new DatabaseHelper();
    var dbClient = await dh.db;
    List<Map> list ;

    if(name != '') {
      list = await dbClient.rawQuery(
          "SELECT * FROM category WHERE name LIKE '%$name%' ");
    }else{
      list = await dbClient.rawQuery('SELECT * FROM category');
    }

    List<CCategory> listCategory = new List();

    for (int i = 0; i < list.length; i++) {
      var category = new CCategory(list[i]["name"]);
      category.setCategoryId(list[i]["id"]);
      listCategory.add(category);
    }
    print(listCategory.length);
    return listCategory;
  }

}
