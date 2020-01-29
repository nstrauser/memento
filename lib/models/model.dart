import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:collection';
import 'dart:io';
import 'dart:convert';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'bill.dart';
import 'database.dart';

class Model extends ChangeNotifier {

  TextEditingController billTitleController = TextEditingController();
  TextEditingController billAmountController = TextEditingController();
  TextEditingController billDueDateController = TextEditingController();

  DatabaseHelper databaseHelper = DatabaseHelper();

  int count = 0;
 List<Bill> _billList = [];

 UnmodifiableListView<Bill> get billList {
   return UnmodifiableListView(_billList);
 }

 int get billCount {
   return _billList.length;
 }

 void addBill() {
   final bill = Bill(
     billName: billTitleController.text,
     billAmount: billAmountController.text,
     billDueDate: billDueDateController.text,
   );
   print("bill: $bill");
   _billList.add(bill);
   notifyListeners();
 }

//
//  Local Persistence
  File jsonFile;
 Directory dir;
 String fileName = 'myJsonfile.json';
 bool fileExists = false;
 Map<String, String> fileContent;

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {

      Future<List<Bill>> noteListFuture = databaseHelper.getBillList();
      noteListFuture.then((billList) {
        billList = billList;
        this.count = billList.length;
      });
    });
  }

//  void getDirectory() {
//  getApplicationDocumentsDirectory().then((Directory directory) {
//    dir = directory;
//    jsonFile = File(dir.path + "/" + fileName);
//    fileExists = jsonFile.existsSync();
//    notifyListeners();
//    if (fileExists == true) {
//      fileContent = json.decode(jsonFile.readAsStringSync());
//    }
//  });

void createFile(Map<String, String> content, Directory dir, String fileName) {
  File file = File(dir.path + "/" + fileName);
  if (fileExists == false) {

  }
  print('creating file');
  file.createSync();
  fileExists = true;
  file.writeAsStringSync(json.encode(content));
}

  void writeToFile(String key, String value) {
  print('write to json file');
  Map<String, String> content = {key: value};
  if (fileExists) {
    print('file exists');
    Map<String, String> jsonFileContent = json.decode(jsonFile.readAsStringSync());
    jsonFileContent.addAll(content);
    jsonFile.writeAsStringSync(json.encode(jsonFileContent));
  } else {
    print('This file does not exist.');
    createFile(content, dir, fileName);
  }
  }
  }
//
//  TOTAL BILLS
// TODO: Running total of $ bills at the bottom of the listView

