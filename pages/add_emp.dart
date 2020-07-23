import 'package:flutter/material.dart';
import 'package:employee_app/services/operations_emp.dart';
import 'package:employee_app/Model/employee.dart';

class AddEmp extends StatelessWidget {
  final TextEditingController nameController=TextEditingController();
  final TextEditingController postController=TextEditingController();
  final TextEditingController salaryController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Add employee'),
      ),
      body: Container(
        width:double.infinity,
        margin:EdgeInsets.all(16),
        padding:EdgeInsets.all(16),
        child:Column(
          children: <Widget>[
            TextField(
                controller:nameController,
                decoration:InputDecoration(hintText: 'enter name'),
              ),
            TextField(
                controller:postController,
                decoration:InputDecoration(hintText: 'enter post'),
              ),
            TextField(
                controller:salaryController,
                decoration:InputDecoration(hintText: 'enter salary'),
              ),
            SizedBox(height:16),
            RaisedButton(
              child: Text('Add employee'),
              onPressed:(){
                String n=nameController.text;
                String p=postController.text;
                int s=int.parse(salaryController.text);

                Employee e=Employee(name: n,post: p,salary: s);

                OperationsEmp.addEmp(e);
                Navigator.pop(context);
              })
          ],)

      ),
    );
  }
}