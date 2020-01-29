import 'package:flutter/material.dart';

enum SingingCharacter { lafayette, jefferson }

class Dialogs {
  SingingCharacter character = SingingCharacter.lafayette;
  information(BuildContext context, String title, String description) {
    return showDialog(
        context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title) ,
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(description),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'))
            ],
          );
    });
  }

//  static Future<DialogAction> yesAbortDialog(
//    BuildContext context,
//    String title,
//    Widget dialogContent,
//  ) async {
//    final action = await showDialog(
//        context: context,
//        barrierDismissible: true,
//        builder: (BuildContext context) {
//          return AlertDialog(
//            shape: RoundedRectangleBorder(
//              borderRadius: BorderRadius.circular(10),
//            ),
//            title: Text(title),
//            actions: <Widget>[
////              ListTile(
////                title: const Text('Lafayette'),
////                leading: Radio(
////                  value: SingingCharacter.lafayette,
////                  groupValue: character,
////                  onChanged: (SingingCharacter value) {
////                    character = value;
////                  },
////                ),
////              ),
////              ListTile(
////                title: const Text('Thomas Jefferson'),
////                leading: Radio(
////                  value: SingingCharacter.jefferson,
////                  groupValue: character,
////                  onChanged: (SingingCharacter value) {
////                    character = value;
////                  },
////                ),
////              ),
////              FlatButton(
////                onPressed: () => Navigator.of(context).pop(DialogAction.abort),
////                child: Text('No'),
////              ),
////              RaisedButton(
////                onPressed: () => Navigator.of(context).pop(DialogAction.yes),
////                child: Text('Yes'),
////              ),
//            ],
//          );
//        });
//  return (action != null) ? action : DialogAction.abort;
//  }
}
