
import 'package:flutter_pdv/app/database/database_hepler.dart';

class SSubcategory {

  int id;
  int _idCategory;
  String _name;

  SSubcategory(this._idCategory, this._name);

  SSubcategory.map(dynamic obj) {
    this._name = obj["name"];
    this._idCategory = obj["category_id"];
  }

  int get idCategory => _idCategory;
  String get name => _name;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    map["category_id"] = _idCategory;
    map["name"] = _name;

    return map;
  }

  void setSubcategoryId(int id) {
    this.id = id;
  }

  //----------------------------------------------------------------------------
  // Dao

  Future<int> save(SSubcategory subcategory) async {

    DatabaseHelper dh = new DatabaseHelper();
    var dbClient = await dh.db;

    int res = await dbClient.insert("subcategory", subcategory.toMap());
    print(" Subcategoria - id insert - $res "  );
    print(res);

    return res;
  }

  Future<int> delete(SSubcategory subcategory) async {

    DatabaseHelper dh = new DatabaseHelper();
    var dbClient = await dh.db;

    int res = await dbClient.rawDelete('DELETE FROM subcategory WHERE id = ?', [subcategory.id]);
    return res;
  }

  Future<bool> update(SSubcategory subcategory) async {

    DatabaseHelper dh = new DatabaseHelper();
    var dbClient = await dh.db;

    int res =   await dbClient.update("subcategory", subcategory.toMap(),
        where: "id = ?", whereArgs: <int>[subcategory.id]);

    return res > 0 ? true : false;
  }

  //----------------------------------------------------------------------------
  // Dao  - Selects

  Future<List<SSubcategory>> getSubcategory() async {

    DatabaseHelper dh = new DatabaseHelper();
    var dbClient = await dh.db;

    List<Map> list = await dbClient.rawQuery('SELECT * FROM subcategory');
    List<SSubcategory> listSubcategory = new List();

    for (int i = 0; i < list.length; i++) {
      var objSubcategory = new SSubcategory(list[i]["category_id"], list[i]["name"]);
      this.id = list[i]["id"];

      listSubcategory.add(objSubcategory);
    }

    print(listSubcategory.length);
    return listSubcategory;
  }

  /*
  Future<List<SSubcategory>> getSubcategorySearch(String name) async {

    DatabaseHelper dh = new DatabaseHelper();
    var dbClient = await dh.db;
    List<Map> list ;

    if(name != '') {
      list = await dbClient.rawQuery(
          "SELECT * FROM subcategory WHERE name LIKE '%$name%' ");
    }else{
      list = await dbClient.rawQuery('SELECT * FROM subcategory');
    }

    List<SSubcategory> listSubcategory = new List();

    for (int i = 0; i < list.length; i++) {
      var objSubcategory = new SSubcategory(list[i]["category_id"], list[i]["name"]);
      this.id = list[i]["id"];

      listSubcategory.add(objSubcategory);
    }

    print(listSubcategory.length);
    return listSubcategory;
  }
  */

  Future<List> getSubcategorySearch(String name) async {

    DatabaseHelper dh = new DatabaseHelper();
    var dbClient = await dh.db;

    List<Map> list ;

    if(name != '') {
      list = await dbClient.rawQuery(
          "SELECT " +
              "a1.id," +
              "a1.name," +
              "a1.category_id," +
              "a2.name AS category" +
              " FROM subcategory AS a1" +
              " INNER JOIN category AS a2 ON(a2.id = a1.category_id)" +
              " WHERE name LIKE '%$name%' ");
    }else{
      list = await dbClient.rawQuery(
          "SELECT " +
              "a1.id," +
              "a1.name," +
              "a1.category_id," +
              "a2.name AS category" +
              " FROM subcategory AS a1" +
              " INNER JOIN category AS a2 ON(a2.id = a1.category_id)" );
    }

    return list;
  }

}
