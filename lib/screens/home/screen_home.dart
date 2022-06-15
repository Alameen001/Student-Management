import 'package:flutter/material.dart';
import 'package:student/functions/db_functions.dart';
import 'package:student/screens/add_student_widget.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.black,
          // title: Text("SCHOOL OF BRO TO TYPE" ,textAlign: TextAlign.center ,),
           title: new Center(child: new Text(" SCHOOL OF BRO TO TYPE", textAlign: TextAlign.center)),
        ),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              AddStudentWidget(),
            ],
          ),
        )),
      ),
    );
  }
}
