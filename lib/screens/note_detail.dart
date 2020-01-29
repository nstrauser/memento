import 'dart:async';
import 'package:flutter/material.dart';
import '../models/note.dart';
import '../utils/database_helper.dart';
import 'package:intl/intl.dart';
import '../widgets/text_field.dart';
import '../widgets/switch.dart';
import '../shared/theme.dart';

const kCalcWidth = 65.0;
const kCalcHeight = 45.0;

class NoteDetail extends StatefulWidget {
  final String appBarTitle;
  final Note note;

  NoteDetail(this.note, this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    return NoteDetailState(this.note, this.appBarTitle);
  }
}

class NoteDetailState extends State<NoteDetail> {
  static var _priorities = ['High', 'Low'];
  List<String> _notificationType = [
    '4 Days Before',
    '1 Week Before',
    '1 Day Before',
    'None'
  ];

  DatabaseHelper helper = DatabaseHelper();

  String appBarTitle;
  Note note;

  String _billPriority = 'Low';

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController dueDateController = TextEditingController();
  TextEditingController billNotesController = TextEditingController();

  NoteDetailState(this.note, this.appBarTitle);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;

    titleController.text = note.title;
    descriptionController.text = note.description;
    amountController.text = note.amount;
    dueDateController.text = note.dueDate;

    return WillPopScope(
        onWillPop: () {
          // Write some code to control things, when user press Back navigation button in device navigationBar
          moveToLastScreen();
        },
        child: Scaffold(
          backgroundColor: kPrimaryColorDark,
          appBar: AppBar(
            title: Text(appBarTitle),
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  // Write some code to control things, when user press back button in AppBar
                  moveToLastScreen();
                }),
          ),
          body: Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
            child: ListView(
              children: <Widget>[
                // First element
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text('Bill\nPriority'),
                      ),
                      //
                      Container(
                        height: 35,
                        child: GestureDetector(
                          onLongPress: () {
                            setState(() {
                              _billPriority = 'Low';
                              updatePriorityAsInt('Low');
                            });
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.yellow[400],
                          ),
                        ),
                      ),
                      //
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        height: 35,
                        child: GestureDetector(
                          onLongPress: () {
                            setState(() {
                              _billPriority = 'High';
                              updatePriorityAsInt('High');
                            });
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.red[400],
                          ),
                        ),
                      ),
                      //
                      Expanded(child: SizedBox(height: 5)),
                      //
                      Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          height: 50,
                          decoration: BoxDecoration(
                              color: Color(0xff072238),
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.grey[500])),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              '$_billPriority',
                              style: textStyle,
                            ),
                          )),
//                      Container(
//                        height: 60,
//                        //margin: EdgeInsets.all(10.0),
//                        padding: EdgeInsets.all(10),
//                        decoration: BoxDecoration(
//                          border: Border.all(color: kSecondaryColorDark),
//                          borderRadius: BorderRadius.circular(5.0),
//                          color: Color(0xff072238),
//                        ),
//                        child: DropdownButtonHideUnderline(
//                          child: DropdownButton(
//                              items:
//                                  _priorities.map((String dropDownStringItem) {
//                                return DropdownMenuItem<String>(
//                                  value: dropDownStringItem,
//                                  child: Text(dropDownStringItem),
//                                );
//                              }).toList(),
//                              style: textStyle,
//                              value: getPriorityAsString(note.priority),
//                              onChanged: (valueSelectedByUser) {
//                                setState(() {
//                                  debugPrint(
//                                      'User selected $valueSelectedByUser');
//                                  updatePriorityAsInt(valueSelectedByUser);
//                                });
//                              }),
//                        ),
//                      ),
                    ],
                  ),
                ),

                // Second Element
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: MyTextField(
                    hintText: 'Title',
                    controller: titleController,
                    style: textStyle,
                    onChanged: (value) {
                      debugPrint('Something changed in Title Text Field');
                      updateTitle();
                    },
                  ),
                ),
                //
                MyTextField(
                  hintText: '\$0.00',
                  style: textStyle,
                  controller: amountController,
                  onChanged: (value) => updateAmount(),
                ),
                //
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton.icon(
                        onPressed: () => _selectDate(context),
                        icon: Icon(
                          Icons.date_range,
                          size: 38,
                        ),
                        label: GestureDetector(
                          onTap: () => _selectDate(context),
                          child: Text(
                            'Due Date',
                            style: textStyle,
                          ),
                        )),
                    GestureDetector(
                      onLongPress: () => _selectDate(context),
                      child: Container(
                          margin: EdgeInsets.symmetric(vertical: 15),
                          padding: EdgeInsets.only(left: 10, right: 70),
                          height: 60,
                          decoration: BoxDecoration(
                              color: Color(0xff072238),
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.grey[500])),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              '${_date.month}/${_date.day}/${_date.year}',
                              style: textStyle,
                            ),
                          )),
                    ),
                  ],
                ),
                //
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Text('Set\nNotification',
                            textAlign: TextAlign.right)),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      height: 60,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(color: kSecondaryColorDark),
                        borderRadius: BorderRadius.circular(5.0),
                        color: Color(0xff072238),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                            hint: Text('4 Days Before'),
                            items: _notificationType
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            style: textStyle,
                            value: getNotificationTypeAsString(
                                note.notificationType),
                            onChanged: (value) {
                              setState(() {
                                debugPrint('NotificationType selected $value');
                                updateNotificationTypeAsInt(value);
                              });
                            }),
                      ),
                    ),
                  ],
                ),
                //
                Row(
                  children: <Widget>[
                    Text(
                      ' Auto Pay',
                      style: textStyle,
                    ),
                    MySwitch(
                      onChanged: (value) {
                        debugPrint('Auto Pay Switch');
                      },
                      value: false,
                    ),
                    Expanded(child: Container()),
                    Text(
                      'Repeat',
                      style: textStyle,
                    ),
                    MySwitch(
                      onChanged: (value) {
                        debugPrint('Repeat Switch');
                      },
                      value: true,
                    ),
                  ],
                ),
                //
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 25.0),
                  child: MyTextField(
                    controller: descriptionController,
                    style: textStyle,
                    onChanged: (value) {
                      debugPrint('Something changed in Description Text Field');
                      updateDescription();
                    },
                    hintText: 'Notes',
                    labelStyle: textStyle,
                  ),
                ),

                // Fourth Element
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      RaisedButton(
                        color: kSecondaryColorDark,
                        textColor: Colors.white,
                        child: Text(
                          'Save',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          setState(() {
                            debugPrint("Save button clicked");
                            _save();
                          });
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                        child: RaisedButton(
                          color: kSecondaryColorDark,
                          textColor: Colors.white,
                          child: Text(
                            'Delete',
                            textScaleFactor: 1.5,
                          ),
                          onPressed: () {
                            setState(() {
                              debugPrint("Delete button clicked");
                              _delete();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  // Convert the String priority in the form of integer before saving it to Database
  void updatePriorityAsInt(String value) {
    switch (value) {
      case 'High':
        note.priority = 1;
        break;
      case 'Low':
        note.priority = 2;
        break;
    }
  }

  //
  void updateNotificationTypeAsInt(String value) {
    switch (value) {
      case '4 Days Before':
        note.notificationType = 1;
        break;
      case '1 Week Before':
        note.notificationType = 2;
        break;
      case '1 Day Before':
        note.notificationType = 3;
        break;
      case 'None':
        note.notificationType = 4;
        break;
    }
  }

  // Convert int priority to String priority and display it to user in DropDown
  String getPriorityAsString(int value) {
    String priority;
    switch (value) {
      case 1:
        priority = _priorities[0]; // 'High'
        break;
      case 2:
        priority = _priorities[1]; // 'Low'
        break;
    }
    return priority;
  }

  String getNotificationTypeAsString(int value) {
    String notificationType;
    switch (value) {
      case 1:
        notificationType = _notificationType[0];
        break;
      case 2:
        notificationType = _notificationType[1];
        break;
      case 3:
        notificationType = _notificationType[2];
        break;
      case 4:
        notificationType = _notificationType[3];
        break;
    }
    return notificationType;
  }

  // Update the title of Note object
  void updateTitle() {
    note.title = titleController.text;
  }

  // Update the description of Note object
  void updateDescription() {
    note.description = descriptionController.text;
  }

  // Update the bill amount
  void updateAmount() {
    note.amount = amountController.text;
  }

  // Save data to database
  void _save() async {
    moveToLastScreen();
    //TODO: Date based on calendar selection.  Test with database.
    note.date = DateFormat.yMMMd().format(DateTime.now());

    int result;
    if (note.id != null) {
      // Case 1: Update operation
      result = await helper.updateNote(note);
    } else {
      // Case 2: Insert Operation
      result = await helper.insertNote(note);
    }

    if (result != 0) {
      // Success
      _showAlertDialog('Status', 'Note Saved Successfully');
    } else {
      // Failure
      _showAlertDialog('Status', 'Problem Saving Note');
    }
  }

  void _delete() async {
    moveToLastScreen();

    // Case 1: If user is trying to delete the NEW NOTE i.e. he has come to
    // the detail page by pressing the FAB of NoteList page.
    if (note.id == null) {
      _showAlertDialog('Status', 'No Note was deleted');
      return;
    }

    // Case 2: User is trying to delete the old note that already has a valid ID.
    int result = await helper.deleteNote(note.id);
    if (result != 0) {
      _showAlertDialog('Status', 'Note Deleted Successfully');
    } else {
      _showAlertDialog('Status', 'Error Occured while Deleting Note');
    }
  }

  void _showAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }

  // Date Time Picker
  DateTime _date = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _date) _date = picked;
    setState(() {
      _date = picked;
    });
  }
}
