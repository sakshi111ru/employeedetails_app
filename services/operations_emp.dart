import 'package:employee_app/Model/employee.dart';

class OperationsEmp{

  static void addEmp(Employee e) {
    employeeList.add(e);
  }

  static void deleteEmployee(int index) {
    employeeList.removeAt(index);
  }

  static void editEmployee(Employee employee, int index){
    employeeList.removeAt(index);
    employeeList.insert(index, employee);
  }

}