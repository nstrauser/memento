//import 'package:flutter/material.dart';
//import '../screens/bill_detail.dart';
//import '../shared/theme.dart';
//
//class BillTile extends StatelessWidget {
//  final billName;
//  final billDueDate;
//  final billAmount;
//
//  BillTile({this.billName, this.billDueDate, this.billAmount});
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
//      child: Card(
//        color: Colors.grey[800],
//        child: ListTile(
//          onTap: () => Navigator.push(context, MaterialPageRoute(
//              builder: (context) { return BillDetail(appBarTitle: 'Edit Bill',);})),
//            leading: CircleAvatar(
//              child: Icon(Icons.play_arrow)),
//            title: Text(billName),
//            subtitle: Text(billDueDate),
//            trailing: Text("\$ $billAmount")),
//      ),
//    );
//  }
//}
