
class Note {

	int _id;
	String _title;
	String _description;
	String _amount;
	String _dueDate;
	int _notificationType;
	bool _autoPay;
	bool _repeat;
	String _date;
	int _priority;

	Note(this._title, this._dueDate, this._priority, [this._amount, this._date, this._notificationType, this._autoPay, this._repeat, this._description]);

	Note.withId(this._id, this._title, this._dueDate, this._priority, [this._amount, this._date, this._notificationType, this._autoPay, this._repeat, this._description]);

	int get id => _id;

	String get title => _title;

	String get description => _description;

	int get priority => _priority;

	String get date => _date;

	String get amount => _amount;

	String get dueDate => _dueDate;

	int get notificationType => _notificationType;

	bool get autoPay => _autoPay;

	bool get repeat => _repeat;

	set title(String newTitle) {
		if (newTitle.length <= 255) {
			this._title = newTitle;
		}
	}

	set description(String newDescription) {
		if (newDescription.length <= 255) {
			this._description = newDescription;
		}
	}

	set priority(int newPriority) {
		if (newPriority >= 1 && newPriority <= 2) {
			this._priority = newPriority;
		}
	}

	set date(String newDate) {
		this._date = newDate;
	}

	set amount(String newAmount) {
		this._amount = newAmount;
	}

	set notificationType(int newNotificationType) {
		this._notificationType = newNotificationType;
	}

	set autoPay(bool newAutoPay) {
		this._autoPay = newAutoPay;
	}
	set repeat(bool newRepeat) {
		this._repeat = newRepeat;
	}

	// Convert a Note object into a Map object
	Map<String, dynamic> toMap() {

		var map = Map<String, dynamic>();
		if (id != null) {
			map['id'] = _id;
		}
		map['title'] = _title;
		map['description'] = _description;
		map['priority'] = _priority;
		map['date'] = _date;

		return map;
	}

	// Extract a Note object from a Map object
	Note.fromMapObject(Map<String, dynamic> map) {
		this._id = map['id'];
		this._title = map['title'];
		this._description = map['description'];
		this._priority = map['priority'];
		this._date = map['date'];
	}
}









