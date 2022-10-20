import 'package:flutter/material.dart';
import 'package:qr_reader/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {


  List<ScanModel> scans = [];
  String selectedType = 'http';
  UniqueKey uniqueKey = UniqueKey();

  Future<ScanModel> newScan(String value) async {
    final newScan = ScanModel(value: value);
    final id = await DBProvider.db.newScan(newScan);
    newScan.id = id;

    if (selectedType == newScan.type) {
      scans.add(newScan);
      notifyListeners();
    }
    return newScan;
  }

  addAllScans(String selectedType) async {
    final scans = await DBProvider.db.getAllScans();
    this.scans = [...?scans];
    notifyListeners();
  }

  addTypeScans(String type) async {
    final scans = await DBProvider.db.getAllScansType(type);
    this.scans = [...?scans];
    selectedType = type;
    notifyListeners();
  }

  deleteAllScans() async {
    await DBProvider.db.deleteAllScan();
    scans = [];
    notifyListeners();
  }

  deleteIdScan(int id) async {
    await DBProvider.db.deleteIdScan(id);
  }
}
