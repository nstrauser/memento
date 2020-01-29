//import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
//import 'package:memento/screens/bill_detail.dart';
//import 'bill_detail.dart';
//import 'package:memento/shared/theme.dart';
//import '../model/model.dart';
//import 'edit_entry.dart';
//import '../widgets/bills_list.dart';
//
//class Memento extends StatelessWidget {
//
//  @override
//  Widget build(BuildContext context) {
//    return Consumer<Model>(builder: (context, model, child) {
////      model.getDirectory();
//      return Scaffold(
//        appBar: AppBar(
//          elevation: 6.0,
//        ),
//        floatingActionButton: FloatingActionButton(
//          tooltip: 'Add a bill',
//          onPressed: () {
//            model.billTitleController.clear();
//            model.billAmountController.clear();
//            model.billDueDateController.clear();
//            Navigator.push(context,
//                MaterialPageRoute(builder: (context) => BillDetail(appBarTitle: 'Add a Bill',)));
//          },
//          child: Icon(
//            Icons.add,
//            size: 34.0,
//          ),
//        ),
//        body: model.billList.length == 0 ? Container(
//          color: Color(0xff2d2d2d),
//          child: Center(
//            child: Text(
//              'Add Bill',
//              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
//            ),
//          ),
//        )
//            : Container(
//          color: Color(0xff2d2d2d),
//          child: BillsList(),
//        )
//      );
//    });
//  }
//}
