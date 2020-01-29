//import 'package:flutter/material.dart';
//import 'package:memento/model/database.dart';
//import 'package:memento/widgets/bill_tile.dart';
//import 'package:sqflite/sqflite.dart';
//import 'package:provider/provider.dart';
//import '../model/model.dart';
//import '../shared/theme.dart';
//import '../model/bill.dart';
//import '../screens/bill_detail.dart';
//
//
//class BillsList extends StatelessWidget {
//final billsSummary;
//BillsList({this.billsSummary});
//
//
//
//  @override
//  Widget build(BuildContext context) {
//    return Consumer<Model>(builder: (context, model, child) {
//      return ListView.builder(
//          itemBuilder: (context, index) {
//            final bill = model.billList[index];
//            if (model.billList == null) {
//              model.updateListView();
//            }
//            return BillTile(
//              billName: bill.billName,
//              billDueDate: bill.billDueDate,
//              billAmount: bill.billAmount,
//            );
//        },
//        itemCount: model.billCount,
//      );
//    });
//  }
//}
