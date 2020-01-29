

class Bill {
  int _id;
  String _billName;
  double _billAmount;
  bool _billType;
  String _billDueDate;
  int _notificationSelected;
  bool _autoPay;
  String _billCategory;
  bool _repeatSelected;
  String _billNotes;

  Bill(this._billName,
      this._billAmount,
      this._billType,
      this._billDueDate,
      this._notificationSelected,
      this._autoPay,
      this._billCategory,
      this._repeatSelected,
      this._billNotes,);

  Bill.withId(this._id,
      this._billName,
      this._billAmount,
      this._billType,
      this._billDueDate,
      this._notificationSelected,
      this._autoPay,
      this._billCategory,
      this._repeatSelected,
      this._billNotes,);

  int get id => _id;

  String get billName => _billName;

  double get billAmount => _billAmount;

  bool get billType => _billType;

  String get billDueDate => _billDueDate;

  int get notificationSelected => _notificationSelected;

  bool get autoPay => _autoPay;

  String get billCategory => _billCategory;

  bool get repeatSelected => _repeatSelected;

  String get billNotes => _billNotes;

  set billName(String newBillName) {
    this._billName = newBillName;
  }

  set billAmount(double newBillAmount) {
    this._billAmount = newBillAmount;
  }

  set billType(bool newBillType) {
    this._billType = newBillType;
  }

  set billDueDate(String newBillDueDate) {
    this._billDueDate = newBillDueDate;
  }

  set notificationSelected(int newNotificationSelected) {
    this._notificationSelected = newNotificationSelected;
  }

  set autoPay(bool newAutoPay) {
    this._autoPay = newAutoPay;
  }

  set billCategory(String newBillCategory) {
    this._billCategory = newBillCategory;
  }

  set repeatSelected(bool newRepeatSelected) {
    this._repeatSelected = newRepeatSelected;
  }

  set billNotes(String newBillNotes) {
    this._billNotes = newBillNotes;
  }

  // Convert a Note object into a Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['id'] = id;
    map['name'] = billName;
    map['amount'] = billAmount;
    map['billType'] = billType;
    map['dueDate'] = billDueDate;
    map['notificationSelected'] = notificationSelected;
    map['autoPay'] = autoPay;
    map['category'] = billCategory;
    map['repeatSelected'] = repeatSelected;
    map['billNotes'] = billNotes;

    return map;
  }


// Extract a Note object from a Map object
  Bill.fromMapObject(Map<String, dynamic> map){
    this._id = map['id'];
    this._billName = map['name'];
    this._billAmount = map['amount'];
    this._billType = map['billType'];
    this._billDueDate = map['dueDate'];
    this._notificationSelected = map['notificationSelected'];
    this._autoPay = map['autoPay'];
    this._billCategory = map['category'];
    this._repeatSelected = map['repeatSelected'];
    this._billNotes = map['billNotes'];
  }
}
