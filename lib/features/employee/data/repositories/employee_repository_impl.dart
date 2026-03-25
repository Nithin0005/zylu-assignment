import '../../domain/entities/employee.dart';
import '../../domain/repositories/employee_repository.dart';
import '../datasources/employee_remote_data_source.dart';

class EmployeeRepositoryImpl implements EmployeeRepository {
  final EmployeeRemoteDataSource remoteDataSource;

  EmployeeRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Employee>> getEmployees() async {
    try {
      return await remoteDataSource.getEmployees();
    } catch (e) {
      throw Exception('Failed to load employees');
    }
  }
}
