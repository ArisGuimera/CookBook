import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tappeando/src/provider/mappers/appinformation_mapper.dart';

import 'datamodel/appinformation_datamodel.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  static Database _database;

  Future<Database> get database async {
    if (_database != null)
      return _database;

    _database = await initDB();
    return _database;
  }


  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TappeandoDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {
    }, onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE AppInformationTable ("
          "id INTEGER PRIMARY KEY,"
          "version TEXT,"
          "test BIT"
          ")");
    });
  }

  Future<void> insertAppInfo(AppInformationDataModel appInfo) async {
    final Database db = await database;
    await db.insert(
      'AppInformationTable',
      appInfo.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  getAppInfo() async {
    final db = await database;
    var res = await db.query("AppInformationTable", where: "id = 0");
    var a = res.isNotEmpty ? AppInformationDataModel.fromJson(res.first) : null;
    return AppInformationMapper().toDomain(a);
  }
}