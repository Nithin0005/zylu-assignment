import '../entities/employee.dart';
import 'package:equatable/equatable.dart';

abstract class EmployeeRepository {
  Future<List<Employee>> getEmployees();
}
