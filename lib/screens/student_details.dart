import 'dart:io';

import 'package:flutter/material.dart';
import 'package:student/model/db_model.dart';
import 'package:student/screens/home/editScreen.dart';

import '../functions/db_functions.dart';


class studentDetails extends StatelessWidget {
  final int index;
  
 studentDetails({ Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {

     return Scaffold( 
      body: Container(decoration: BoxDecoration(
        
          gradient: LinearGradient(
              colors: [Colors.purple[200]!, Color.fromARGB(255, 46, 191, 111)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
              
        ),
      
        child: SafeArea(
          
            child: ValueListenableBuilder(
          valueListenable: studentListNotifier,
          builder:
              (BuildContext ctx, List<StudentModel> studentList, Widget? child) {
                final student=studentList[index];

            return Center(
              child: Column(
                children: [
                  Container(
                    color: Colors.greenAccent,
                    width: 250,
                    height: 300,
                    child: Image.file(new File(student.image),),
                  ),
                  Text("Name : ${student.name}"),
                  Text("Age : ${student.age}"),
                  Text("Phone Number : ${student.phone}"),
                  Text("Class : ${student.Class}"),
                ],
              ),
            );
          },
        )
        
        ),
        
      ),
     floatingActionButton:  FloatingActionButton.extended(
        onPressed: () {
         

           Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx1) =>EditScreen (index: index,)));
        },
        label: const Text('Edit'),
        icon: const Icon(Icons.edit_note
      ),
    ));
  }
}

