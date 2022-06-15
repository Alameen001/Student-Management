import 'dart:io';
import 'package:flutter/material.dart';
import 'package:student/functions/db_functions.dart';
import 'package:student/model/db_model.dart';
import 'package:student/screens/formfield.dart';
import 'package:student/screens/list_student_widget.dart';
import 'package:flutter/services.dart';

class AddStudentWidget extends StatefulWidget {
  AddStudentWidget({Key? key}) : super(key: key);

  @override
  State<AddStudentWidget> createState() => _AddStudentWidgetState();
}

class _AddStudentWidgetState extends State<AddStudentWidget> {
  final _nameController = TextEditingController();

  final _ageController = TextEditingController();

  final _phoneController = TextEditingController();

  final _classcontroller = TextEditingController();

  var _image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Colors.blue,
          Colors.yellow,
        ],
      )),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/images/schl_logo-removebg-preview.png")))
                //child: Image(image: FileImage(File(_image))),
                ),
            Field(Control: _nameController, TextHint: 'Name'),
            SizedBox(height: 20),
            Field(Control: _ageController, TextHint: 'Age'),
            SizedBox(
              height: 20,
            ),
            Field(
              Control: _phoneController,
              TextHint: 'Phone Number',
            ),
            SizedBox(
              height: 20,
            ),
            Field(Control: _classcontroller, TextHint: 'Class'),
            ElevatedButton(
              onPressed: () async {
                var image = await imageSelect();
                setState(() {
                  _image = image;
                });
              },
              child: Text(
                'Select Image',
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                addStudentButton();
              },
              child: Text('Add Student'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx1) => ListStudentWidget()));
              },
              label: Text('View List'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
              icon: Icon(
                Icons.list,
              ),
            ),
            Container(
              width: 100, height: 100,
              decoration: _image == null
                  ? BoxDecoration()
                  : BoxDecoration(
                      image: DecorationImage(
                          image: FileImage(File(_image)), fit: BoxFit.cover)),
              //child: Image(image: FileImage(File(_image))),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> addStudentButton() async {
    final _name = _nameController.text;
    final _age = _ageController.text;
    final _phone = _phoneController.text;
    final _class = _classcontroller.text;

    if (_name.isEmpty ||
        _age.isEmpty ||
        _class.isEmpty ||
        _phone.isEmpty ||
        _image == null) {
      return;
    }
    final _student = StudentModel(
        name: _name, age: _age, Class: _class, phone: _phone, image: _image);

    addStudent(_student);

    _image = null;
  }
}
