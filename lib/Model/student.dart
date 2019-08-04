//Creating a class so that it can be used for writing data in firestore
class Student{
  String _name;

  String get names => _name;

  set name(String value) {
    _name = value;
  }

  String _username;
  String _email;
  String _phone;
  String _stream;
  String _year;
  String _password;
  Map<dynamic,dynamic> X=Map();

  toFirestore(){
    //function which will be used for creating the value(value is also a map) of map
    // of Student's Data(Data(field){key:{value}}) in firestore
    return{
      "Name": _name,
      "UserName":_username,
      "Email": _email,
      "Phone": _phone,
      "Stream": _stream,
      "Year" : _year,
      "Password" : _password,
    };
  }

  String get usernames => _username;

  set username(String value) {
    _username = value;
  }

  String get emails => _email;

  set email(String value) {
    _email = value;
  }

  String get phones => _phone;

  set phone(String value) {
    _phone = value;
  }

  String get streams => _stream;

  set stream(String value) {
    _stream = value;
  }

  String get years => _year;

  set year(String value) {
    _year = value;
  }

  String get passwords => _password;

  set password(String value) {
    _password = value;
  }
}

