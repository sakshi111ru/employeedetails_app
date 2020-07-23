
import 'package:employee_app/Model/employee.dart';
import 'package:employee_app/services/operations_emp.dart';
import 'package:flutter/material.dart';

class EditEmp extends StatelessWidget {
  final Employee employee;
  final int index;

  EditEmp({this.employee, this.index});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController postController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = employee.name;
    postController.text = employee.post;
    salaryController.text = employee.salary.toString();

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Employee'),
      ),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(hintText: 'Enter  Name'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: postController,
              decoration: InputDecoration(hintText: 'Enter Post'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: salaryController,
              decoration: InputDecoration(hintText: 'Enter Salary'),
            ),
            SizedBox(height: 16),
            RaisedButton(
              child: Text('Edit Employee'),
              onPressed: () {
                String n = nameController.text;
                String p = postController.text;
                int s = int.parse(salaryController.text);

                Employee e = Employee(name: n, post: p, salary: s);
                OperationsEmp.editEmployee(e, index);

                // go back to home page
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
