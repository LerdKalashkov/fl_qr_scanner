import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:qr_reader/models/scan_model.dart';
export 'package:qr_reader/models/scan_model.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database?> get database async {
    if (_database != null) return _database;

    return _database = await initDB();
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'ScansDB.db');
    // ignore: avoid_print
    print(path);

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
          CREATE TABLE Scans(
            id INTERGER PRIMARY KEY,
            type TEXT,
            value TEXT
            )
          ''');
    });
  }

  ///;/how to do a query petition for insert new data from to db  with types.
  Future<int?> newScanRaw(ScanModel newScan) async {
    final id = newScan.id;
    final type = newScan.type;
    final value = newScan.value;

    final db = await database;
    final res = await db?.rawInsert('''
    INSERT INTO Scans(id, type, value)
    VALUES ( $id, '$type', '$value'
    )
    ''');
    return res;
  }

////how to insert new data with .Json model from to db.
  Future<int> newScan(ScanModel newScan) async {
    final db = await database;
    final res = await db!.insert('Scans', newScan.toJson());
    return res;
  }
  
////how to get the items from db using the id for select
////the row with the id selected.
  Future<ScanModel?> getScanById(int id) async {
    final db = await database;
    final res = await db?.query('Scans', where: 'id = ? ', whereArgs: [id]);

    return res!.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

////How to get the all items like required List from db.
  Future<List<ScanModel>?> getAllScans() async {
    final db = await database;
    final res = await db?.query('Scans');

    return res!.isNotEmpty
        ? res.map((s) => ScanModel.fromJson(s)).toList()
        : [];
  }

////How to get the all instancies from db like with a type query.
  Future<List<ScanModel>?> getAllScansType(String type) async {
    final db = await database;
    final res = await db?.rawQuery('''
    SELECT * FROM Scans WHERE type = '$type'
  ''');

    return res!.isNotEmpty
        ? res.map((s) => ScanModel.fromJson(s)).toList()
        : [];
  }

////how to update data from db with specific sentencie.
  Future<int?> updateScan(ScanModel newScan) async {
    final db = await database;
    final res = await db?.update('Scans', newScan.toJson(),
        where: 'id = ?', whereArgs: ([newScan.id]));
    return res;
  }

  ///how to delete data from db with id like a query indicator.
  Future<int?> deleteIdScan(int id) async {
    final db = await database;
    final res = await db?.delete('Scans', where: 'id = ?', whereArgs: [id]);
    return res;
  }

////How to delete the all scans.
  Future<int?> deleteAllScan() async {
    final db = await database;
    final res = await db?.delete('Scans');
    return res;
  }
}
