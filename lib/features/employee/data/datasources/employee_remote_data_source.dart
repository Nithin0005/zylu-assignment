import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/employee_model.dart';

abstract class EmployeeRemoteDataSource {
  Future<List<EmployeeModel>> getEmployees();
}

class EmployeeRemoteDataSourceImpl implements EmployeeRemoteDataSource {
  final http.Client client;

  EmployeeRemoteDataSourceImpl(this.client);

  @override
  Future<List<EmployeeModel>> getEmployees() async {
    final response = await client.get(
      Uri.parse('http://192.168.22.122/employee_api/get_employees.php'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => EmployeeModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load employees');
    }
  }
}
