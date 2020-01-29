//import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
//import 'dart:async';
//import 'package:memento/model/model.dart';
//import 'package:memento/shared/theme.dart';
//import '../widgets/text_form_field.dart';
//import 'memento.dart';
//import 'package:memento/widgets/dialogs.dart';
//import 'package:memento/widgets/notification.dart';
//import '../model/bill.dart';
//
//const kFieldMargins = EdgeInsets.symmetric(vertical: 10.0);
//
//
//class BillDetail extends StatelessWidget {
//  final appBarTitle;
//  BillDetail({this.appBarTitle});
//  @override
//  Widget build(BuildContext context) {
//    return Consumer<Model>(builder: (context, model, child) {
//      return Scaffold(
//        appBar: AppBar(
//          leading: GestureDetector(
//            onTap: () => Navigator.of(context).pop(context),
//              child: Icon(Icons.close)),
//          elevation: 6.0,
//          title: Text(appBarTitle),
//          actions: <Widget>[
//            IconButton(
//              icon: Icon(Icons.save),
//            onPressed: () {
//                model.addBill();
//                Navigator.of(context).pop(context);
//            },
//            ),
//          ]
//        ),
//        body: SingleChildScrollView(
//          child: Container(
//            margin: EdgeInsets.all(25.0),
//            child: Column(
//              mainAxisSize: MainAxisSize.max,
//              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: <Widget>[
//                Row(
//                  children: <Widget>[
//                Icon(Icons.account_box, size: 32.0, color: Colors.grey,),
//                    Text("  Name"),
//                  ],
//                ),
//                MyTextFormField(hintText: "Company",
//                controller: model.billTitleController,
//                ),
//                Row(
//                  children: <Widget>[
//                    Icon(Icons.attach_money, size: 32.0, color: Colors.grey,),
//                Text(" Amount",),
//                  ],
//                ),
//                MyTextFormField(hintText: "\$0.00",
//                controller: model.billAmountController,),
//                Column(
//                  children: <Widget>[
//                Align(
//                    alignment: Alignment.topLeft,
//                  child: Row(children: <Widget>[
//                    Icon(Icons.calendar_today, size: 32.0, color: Colors.grey,),
//                    Text("   Due Date"),
//                  ],
//                  )),
//                    MyTextFormField(hintText: '01/01/2020', controller: model.billDueDateController,)
//                  ],
//                ),
//                Column(
//                  mainAxisAlignment: MainAxisAlignment.spaceAround,
//                  children: <Widget>[
//                    Align(
//                      alignment: Alignment.topLeft,
//                      child: Row(children: <Widget>[
//                        Icon(Icons.alarm, size: 32.0, color: Colors.grey,),
//                        Text("  Notification"),
//                      ],),
//                    ),
//                    Align(
//                      alignment: Alignment.bottomRight,
//                      child: MaterialButton(
//padding: EdgeInsets.all(2.0),
//                          child: Align(alignment: Alignment.bottomRight,child: Text('2 days before due date', style: Theme.of(context).textTheme.subhead,)),
//                          onPressed: () {
//
//                          }),
//                    ),
//                    Divider(thickness: 2.0),
//                  ],
//                ),
//
//                Column(
//                  children: <Widget>[
//                    Align(
//                        alignment: Alignment.topLeft,
//                    child: Row(children: <Widget>[
//                      Icon(Icons.refresh, size: 32.0, color: Colors.grey,),
//                      Text("  Auto Pay"),
//                    ],),),
//                    Align(
//                        alignment: Alignment.bottomRight,
//                        child: Switch(
//                            activeColor: kPrimaryColorLight,
//                            inactiveThumbColor: Colors.grey[600],
//                            inactiveTrackColor: Colors.grey,
//                            value: true,
//                            onChanged: (value) {
//                              print('auto pay value changed');
//                            },
//                            )),
//                    Divider(thickness: 2.0),
//                  ],
//                ),
//                Column(
//                  children: <Widget>[
//                    Align(
//                      alignment: Alignment.topLeft,
//                      child: Row(children: <Widget>[
//                        Icon(Icons.category, size: 32.0, color: Colors.grey,),
//                        Text("  Catagory"),
//                      ],),
//                    ),
//                    Divider(thickness: 2.0),
//                  ],
//                ),
//                TextFormField(),
//                Column(
//                  children: <Widget>[
//                    Row(
//                      children: <Widget>[
//                        Icon(Icons.repeat, size: 32.0, color: Colors.grey,),
//                        Text("  Repeat"),
//                      ],
//                    ),
//                TextFormField(),
//                  ],
//                ),
//                Column(
//                  children: <Widget>[
//                    Row(
//                      children: <Widget>[
//                        Icon(Icons.note, size: 32.0, color: Colors.grey,),
//                        Text("  Note"),
//                      ],
//                    ),
//                TextFormField(),
//                  ],
//                ),
//               ],
//            ),
//          ),
//        ),
//      );
//    });
//  }
//}
//
//
