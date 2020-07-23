import 'package:employee_app/Model/employee.dart';
import 'package:employee_app/services/operations_emp.dart';
import 'package:flutter/material.dart';
import 'edit_emp.dart';
import 'add_emp.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Employee Details'),
      ),
      floatingActionButton: FloatingActionButton(
        child:Icon(Icons.add),
        onPressed:()async{
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext context)=>AddEmp()
           ),
          );
          setState(() {
            
          });
        } 
        ),
        body: employeeList.length==0?
        Center(
          child:Text('no employee found')
        ):
        ListView.builder(
          itemCount: employeeList.length,
          itemBuilder: (BuildContext context,int index){
            Employee e=employeeList[index];
            return ListTile(
              leading:CircleAvatar(child:Text(e.name[0])),
              title:Text(e.name),
              subtitle:Text('${e.post} (${e.salary})'),
              trailing: Row(
                mainAxisSize:MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed:(){
                      OperationsEmp.deleteEmployee(index);
                      setState(() {
                        
                      });
                    }),
                    IconButton(
                      icon:Icon(Icons.edit),
                      onPressed:()async{
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:(BuildContext context)=>EditEmp(
                              employee:e,
                              index:index,
                            ) )
                        );
                        setState(() {
                          
                        });
                      }
                      )
                ],
              ),
            );
          })
        ,
    );
  }
}