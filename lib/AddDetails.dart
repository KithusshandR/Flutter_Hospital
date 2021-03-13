import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MaterialApp(
    home: AddDetails(),
  ));
}

// ignore: must_be_immutable
class AddDetails extends KFDrawerContent {
  AddDetails({
    Key key,
  });
  @override
  _AddDetailsState createState() => _AddDetailsState();
}

class _AddDetailsState extends State<AddDetails> {
  final _key = GlobalKey<FormState>();
  final _formkey = GlobalKey<FormState>();
  final _fkey = GlobalKey<FormState>();
  String _date = "Choose Date";
  String _time = "Choose Time";
  String _date1 = "Choose Date";
  String _date2 = "Choose Date";

  int selectedRadio;
  String _gender = "";

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  TextEditingController p1 = new TextEditingController();
  TextEditingController p2 = new TextEditingController();
  TextEditingController p3 = new TextEditingController();
  TextEditingController p4 = new TextEditingController();
  TextEditingController t1 = new TextEditingController();
  TextEditingController t2 = new TextEditingController();
  TextEditingController t3 = new TextEditingController();
  TextEditingController t4 = new TextEditingController();
  TextEditingController c1 = new TextEditingController();
  TextEditingController c2 = new TextEditingController();

  clearTextInput() {
    p2.clear();
    p3.clear();
    p4.clear();
    t1.clear();
    t2.clear();
    t3.clear();
    t4.clear();
    c1.clear();
    c2.clear();
  }

  final databaseReference = FirebaseFirestore.instance;

  void createRecord1() async {
    await databaseReference.collection("Patient Details").doc(p1.text).set({
      "patientId": p1.text,
      "patientName": p2.text,
      "contactNumber": p3.text,
      "age": p4.text,
      "date": _date,
      "time": _time,
      "gender": _gender
    });
  }

  void createRecord2() async {
    await databaseReference.collection("Treatment Details").doc(t1.text).set({
      "TreatmentId": t1.text,
      "Disease": t2.text,
      "Progress": t3.text,
      "Age": t4.text,
      "NoOfVisit": _date1,
      "PatientId": p1.text,
    });
  }

  void createRecord3() async {
    await databaseReference.collection("CheckUp Details").doc(c1.text).set({
      "CheckUpId": c1.text,
      "Prescription": c2.text,
      "CheckUpDate": _date2,
      "PatientId": p1.text,
    });
  }

  void updateData1() {
    try {
      databaseReference.collection('Patient Details').doc(p1.text).set({
        "patientId": p1.text,
        "patientName": p2.text,
        "contactNumber": p3.text,
        "age": p4.text,
        "date": _date,
        "time": _time,
        "gender": _gender
      });
    } catch (e) {
      print(e.toString());
    }
  }

  void updateData2() {
    try {
      databaseReference.collection('Treatment Details').doc(t1.text).set({
        "TreatmentId": t1.text,
        "Disease": t2.text,
        "Progress": t3.text,
        "Age": t4.text,
        "NoOfVisit": _date1,
        "PatientId": p1.text,
      });
    } catch (e) {
      print(e.toString());
    }
  }

  void updateData3() {
    try {
      databaseReference.collection('CheckUp Details').doc(c1.text).set({
        "CheckUpId": c1.text,
        "Prescription": c2.text,
        "CheckUpDate": _date2,
        "PatientId": p1.text,
      });
    } catch (e) {
      print(e.toString());
    }
  }

  void deleteData1() {
    try {
      databaseReference.collection('Patient Details').doc(p1.text).delete();
    } catch (e) {
      print(e.toString());
    }
  }

  void deleteData2() {
    try {
      databaseReference.collection('Treatment Details').doc(t1.text).delete();
    } catch (e) {
      print(e.toString());
    }
  }

  void deleteData3() {
    try {
      databaseReference.collection('CheckUp Details').doc(c1.text).delete();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    child: Material(
                      shadowColor: Colors.transparent,
                      color: Colors.transparent,
                      child: IconButton(
                        icon: Icon(
                          Icons.menu,
                          color: Colors.teal[900],
                        ),
                        onPressed: widget.onMenuPressed,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            child: Form(
              key: _key,
              child: Card(
                elevation: 10,
                color: Colors.white70,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.elliptical(40, 80))),
                child: ExpansionTile(
                  title: Text(
                    'Patient Details',
                    style: TextStyle(
                        color: Colors.teal[900],
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  leading: Icon(
                    Icons.dynamic_form,
                    color: Colors.teal[900],
                    size: 30,
                  ),
                  children: <Widget>[
                    TextFormField(
                      controller: p1,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Patient ID can not be empty";
                        } else if (value.length <= 4) {
                          return "Patient ID should be greater than 4";
                        } else
                          return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Patient ID",
                        labelStyle:
                            TextStyle(color: Colors.teal[900], fontSize: 16.0),
                        fillColor: Colors.teal[900],
                        prefixIcon:
                            Icon(Icons.perm_identity, color: Colors.teal[900]),
                        contentPadding: EdgeInsets.all(8),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.teal, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2.0, color: Colors.teal),
                        ),
                      ),
                    ),
                    new Text(
                      '',
                    ),
                    TextFormField(
                      controller: p2,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Patient Name can not be empty";
                        } else if (value.length <= 5) {
                          return "Patient Name should be greater than 5";
                        } else
                          return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Patient Name",
                        labelStyle:
                            TextStyle(color: Colors.teal[900], fontSize: 16.0),
                        fillColor: Colors.teal[900],
                        prefixIcon: Icon(Icons.face, color: Colors.teal[900]),
                        contentPadding: EdgeInsets.all(8),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.teal, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2.0, color: Colors.teal),
                        ),
                      ),
                    ),
                    new Text(
                      '',
                    ),
                    TextFormField(
                      controller: p3,
                      validator: (value) {
                        String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                        RegExp regExp = new RegExp(patttern);
                        if (value.length == 0) {
                          return 'Contact Number can not be empty';
                        } else if (!regExp.hasMatch(value)) {
                          return 'Please enter valid mobile number';
                        } else
                          return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Contact Number",
                        labelStyle:
                            TextStyle(color: Colors.teal[900], fontSize: 16.0),
                        prefixIcon: Icon(Icons.phone, color: Colors.teal[900]),
                        fillColor: Colors.teal[900],
                        contentPadding: EdgeInsets.all(8),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.teal, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2.0, color: Colors.teal),
                        ),
                      ),
                    ),
                    new Text(
                      '',
                    ),
                    TextFormField(
                      controller: p4,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Age can not be empty";
                        } else
                          return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Age",
                        labelStyle:
                            TextStyle(color: Colors.teal[900], fontSize: 16.0),
                        fillColor: Colors.teal[900],
                        prefixIcon: Icon(Icons.face, color: Colors.teal[900]),
                        contentPadding: EdgeInsets.all(8),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.teal, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2.0, color: Colors.teal),
                        ),
                      ),
                    ),
                    new Text(
                      '',
                    ),
                    new Text(
                      'Next Checkup Date',
                      style: new TextStyle(
                        color: Colors.teal[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    new Text(
                      '',
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 10,
                          primary: Colors.white70,
                          onPrimary: Colors.white),
                      onPressed: () {
                        DatePicker.showDatePicker(context,
                            theme: DatePickerTheme(
                              containerHeight: 210.0,
                            ),
                            showTitleActions: true,
                            minTime: DateTime(2000, 1, 1),
                            maxTime: DateTime(2022, 12, 31), onConfirm: (date) {
                          print('confirm $date');
                          _date = '${date.year} - ${date.month} - ${date.day}';
                          setState(() {});
                        }, currentTime: DateTime.now(), locale: LocaleType.en);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.date_range,
                                        size: 18.0,
                                        color: Colors.teal[900],
                                      ),
                                      Text(
                                        " $_date",
                                        style: TextStyle(
                                            color: Colors.teal[900],
                                            fontSize: 16.0),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    new Text(
                      'Next Checkup Time',
                      style: new TextStyle(
                        color: Colors.teal[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    new Text(
                      '',
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 10,
                          primary: Colors.white70,
                          onPrimary: Colors.white),
                      onPressed: () {
                        DatePicker.showTimePicker(context,
                            theme: DatePickerTheme(
                              containerHeight: 210.0,
                            ),
                            showTitleActions: true, onConfirm: (time) {
                          print('confirm $time');
                          _time =
                              '${time.hour} : ${time.minute} : ${time.second}';
                          setState(() {});
                        }, currentTime: DateTime.now(), locale: LocaleType.en);
                        setState(() {});
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.access_time,
                                        size: 18.0,
                                        color: Colors.teal[900],
                                      ),
                                      Text(
                                        " $_time",
                                        style: TextStyle(
                                            color: Colors.teal[900],
                                            fontSize: 16.0),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    new Text(
                      '',
                    ),
                    new Text(
                      'Gender',
                      style: new TextStyle(
                        color: Colors.teal[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Radio(
                          value: 0,
                          groupValue: selectedRadio,
                          activeColor: Colors.teal[900],
                          onChanged: (val) {
                            print("Radio $val");
                            _gender = 'Male';
                            setSelectedRadio(val);
                          },
                        ),
                        new Text(
                          'Male',
                          style: new TextStyle(
                              color: Colors.teal[900], fontSize: 16.0),
                        ),
                        new Radio(
                          value: 1,
                          groupValue: selectedRadio,
                          activeColor: Colors.teal[900],
                          onChanged: (val) {
                            print("Radio $val");
                            _gender = 'Female';
                            setSelectedRadio(val);
                          },
                        ),
                        new Text(
                          'Female',
                          style: new TextStyle(
                            color: Colors.teal[900],
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                    new Text(
                      '',
                    ),
                    new SizedBox(
                      width: 150,
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding:
                              EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                          primary: Colors.teal[900],
                          elevation: 10,
                        ),
                        child: Text('Add'),
                        onPressed: () {
                          if (_key.currentState.validate()) {
                            print("Your data is added");
                          }
                          createRecord1();
                          clearTextInput();
                        },
                      ),
                    ),
                    ButtonBar(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 5),
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                            primary: Colors.teal[900],
                            elevation: 10,
                          ),
                          onPressed: () {
                            updateData1();
                          },
                          child: Text("Update"),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 5),
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                            primary: Colors.teal[900],
                            elevation: 10,
                          ),
                          onPressed: () {
                            deleteData1();
                          },
                          child: Text("Delete"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: Form(
              key: _formkey,
              child: Card(
                elevation: 10,
                color: Colors.white70,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.elliptical(40, 80))),
                child: ExpansionTile(
                  title: Text(
                    'Treatment Details',
                    style: TextStyle(
                        color: Colors.teal[900],
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  leading: Icon(
                    Icons.dynamic_form,
                    color: Colors.teal[900],
                    size: 30,
                  ),
                  children: <Widget>[
                    TextFormField(
                      controller: t1,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Treatment ID can not be empty";
                        } else if (value.length <= 4) {
                          return "Treatment ID should be greater than 4";
                        } else
                          return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Treatment ID",
                        labelStyle:
                            TextStyle(color: Colors.teal[900], fontSize: 16.0),
                        fillColor: Colors.teal[900],
                        prefixIcon:
                            Icon(Icons.perm_identity, color: Colors.teal[900]),
                        contentPadding: EdgeInsets.all(8),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.teal, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2.0, color: Colors.teal),
                        ),
                      ),
                    ),
                    new Text(
                      '',
                    ),
                    TextFormField(
                      controller: t2,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Disease can not be empty";
                        } else
                          return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Disease",
                        labelStyle:
                            TextStyle(color: Colors.teal[900], fontSize: 16.0),
                        fillColor: Colors.teal[900],
                        prefixIcon: Icon(Icons.pages, color: Colors.teal[900]),
                        contentPadding: EdgeInsets.all(8),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.teal, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2.0, color: Colors.teal),
                        ),
                      ),
                    ),
                    new Text(
                      '',
                    ),
                    TextFormField(
                      controller: t3,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Progress can not be empty";
                        } else
                          return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Progress",
                        labelStyle:
                            TextStyle(color: Colors.teal[900], fontSize: 16.0),
                        fillColor: Colors.teal[900],
                        prefixIcon:
                            Icon(Icons.description, color: Colors.teal[900]),
                        contentPadding: EdgeInsets.all(8),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.teal, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2.0, color: Colors.teal),
                        ),
                      ),
                    ),
                    new Text(
                      '',
                    ),
                    TextFormField(
                      controller: t4,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "No of Visits can not be empty";
                        } else
                          return null;
                      },
                      decoration: InputDecoration(
                        labelText: "No of Visits",
                        labelStyle:
                            TextStyle(color: Colors.teal[900], fontSize: 16.0),
                        fillColor: Colors.teal[900],
                        prefixIcon: Icon(Icons.exposure_plus_1,
                            color: Colors.teal[900]),
                        contentPadding: EdgeInsets.all(8),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.teal, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2.0, color: Colors.teal),
                        ),
                      ),
                    ),
                    new Text(
                      '',
                    ),
                    new Text(
                      'Start Date',
                      style: new TextStyle(
                        color: Colors.teal[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    new Text(
                      '',
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 10,
                          primary: Colors.white70,
                          onPrimary: Colors.white),
                      onPressed: () {
                        DatePicker.showDatePicker(context,
                            theme: DatePickerTheme(
                              containerHeight: 210.0,
                            ),
                            showTitleActions: true,
                            minTime: DateTime(2000, 1, 1),
                            maxTime: DateTime(2022, 12, 31), onConfirm: (date) {
                          print('confirm $date');
                          _date1 = '${date.year} - ${date.month} - ${date.day}';
                          setState(() {});
                        }, currentTime: DateTime.now(), locale: LocaleType.en);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.date_range,
                                        size: 18.0,
                                        color: Colors.teal[900],
                                      ),
                                      Text(
                                        " $_date1",
                                        style: TextStyle(
                                            color: Colors.teal[900],
                                            fontSize: 16.0),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    new SizedBox(
                      width: 150,
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding:
                              EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                          primary: Colors.teal[900],
                          elevation: 10,
                        ),
                        child: Text('Add'),
                        onPressed: () {
                          if (_fkey.currentState.validate()) {
                            print("Your data is added");

                            createRecord2();
                            clearTextInput();
                          }
                        },
                      ),
                    ),
                    ButtonBar(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 5),
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                            primary: Colors.teal[900],
                            elevation: 10,
                          ),
                          onPressed: () {
                            updateData2();
                          },
                          child: Text("Update"),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 5),
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                            primary: Colors.teal[900],
                            elevation: 10,
                          ),
                          onPressed: () {
                            deleteData2();
                          },
                          child: Text("Delete"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: Form(
              key: _fkey,
              child: Card(
                elevation: 10,
                color: Colors.white70,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.elliptical(40, 80))),
                child: ExpansionTile(
                  title: Text(
                    'Checkup Details',
                    style: TextStyle(
                        color: Colors.teal[900],
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  leading: Icon(
                    Icons.dynamic_form,
                    color: Colors.teal[900],
                    size: 30,
                  ),
                  children: <Widget>[
                    TextFormField(
                      controller: c1,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Checkup ID can not be empty";
                        } else if (value.length <= 4) {
                          return "Checkup ID should be greater than 4";
                        } else
                          return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Checkup ID",
                        labelStyle:
                            TextStyle(color: Colors.teal[900], fontSize: 16.0),
                        fillColor: Colors.teal[900],
                        prefixIcon:
                            Icon(Icons.perm_identity, color: Colors.teal[900]),
                        contentPadding: EdgeInsets.all(8),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.teal, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2.0, color: Colors.teal),
                        ),
                      ),
                    ),
                    new Text(
                      '',
                    ),
                    TextFormField(
                      controller: c2,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Prescription can not be empty";
                        } else
                          return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Prescription",
                        labelStyle:
                            TextStyle(color: Colors.teal[900], fontSize: 16.0),
                        fillColor: Colors.teal[900],
                        prefixIcon:
                            Icon(Icons.description, color: Colors.teal[900]),
                        contentPadding: EdgeInsets.all(8),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.teal, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2.0, color: Colors.teal),
                        ),
                      ),
                    ),
                    new Text(
                      '',
                    ),
                    new Text(
                      'Checkup Date',
                      style: new TextStyle(
                        color: Colors.teal[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    new Text(
                      '',
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 10,
                          primary: Colors.white70,
                          onPrimary: Colors.white),
                      onPressed: () {
                        DatePicker.showDatePicker(context,
                            theme: DatePickerTheme(
                              containerHeight: 210.0,
                            ),
                            showTitleActions: true,
                            minTime: DateTime(2000, 1, 1),
                            maxTime: DateTime(2022, 12, 31), onConfirm: (date) {
                          print('confirm $date');
                          _date2 = '${date.year} - ${date.month} - ${date.day}';
                          setState(() {});
                        }, currentTime: DateTime.now(), locale: LocaleType.en);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.date_range,
                                        size: 18.0,
                                        color: Colors.teal[900],
                                      ),
                                      Text(
                                        " $_date2",
                                        style: TextStyle(
                                            color: Colors.teal[900],
                                            fontSize: 16.0),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    new SizedBox(
                      width: 150,
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding:
                              EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                          primary: Colors.teal[900],
                          elevation: 10,
                        ),
                        child: Text('Add'),
                        onPressed: () {
                          if (_fkey.currentState.validate()) {
                            print("Your data is added");
                            createRecord3();
                            clearTextInput();
                          }
                        },
                      ),
                    ),
                    ButtonBar(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 5),
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                            primary: Colors.teal[900],
                            elevation: 10,
                          ),
                          onPressed: () {
                            updateData3();
                          },
                          child: Text("Update"),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 5),
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                            primary: Colors.teal[900],
                            elevation: 10,
                          ),
                          onPressed: () {
                            deleteData3();
                          },
                          child: Text("Delete"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
