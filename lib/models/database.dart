import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'dart:convert';
import 'bill.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;

  String billTable = 'billTable';
  String colId = 'id';
  String colTitle = 'title';
  String colAmount = 'amount';
  String colDueDate = 'dueDate';

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'bills.db';
    var billsDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return billsDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CEATE TABLE $billTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, '
        '$colAmount TEXT, $colDueDate TEXT');
  }

//
// -------------- CRUD ---------------- //
// Fetch Operation
  Future<List<Map<String, dynamic>>> getBillMapList() async {
    Database db = await this.database;
    var result = await db.rawQuery('SELECT * FROM $billTable');
    return result;
  }

// Insert Operation
  Future<int> insertBill(Bill bill) async {
    Database db = await this.database;
    var result = await db.insert(billTable, bill.toMap());
    return result;
  }

// Update Operation
  Future<int> updateBill(Bill bill) async {
    var db = await this.database;
    var result = await db.update(billTable, bill.toMap(),
        where: '$colId = ?', whereArgs: [bill.id]);
    return result;
  }

// Delete Operation
  Future<int> deleteBill(int id) async {
    var db = await this.database;
    int result =
        await db.rawDelete('DELETE FROM $billTable WHERE $colId = $id');
    return result;
  }

// Get total number of objects in DB
  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from $billTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }
// get the Map List >> Convert it to Bill List Object
  Future<List<Bill>> getBillList() async {
    var billMapList = await getBillMapList();
    int count = billMapList.length;

    List<Bill> billList = List<Bill>();

    for (int i = 0; i < count; i++) {
      billList.add(Bill.fromMapObject(billMapList[i]));
    }
    return billList;
  }

}
