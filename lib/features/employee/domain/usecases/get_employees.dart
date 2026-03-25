import '../../../../core/usecase.dart';
import '../entities/employee.dart';
import '../repositories/employee_repository.dart';

class GetEmployees implements UseCase<List<Employee>, NoParams> {
  final EmployeeRepository repository;

  GetEmployees(this.repository);

  @override
  Future<List<Employee>> call(NoParams params) {
    return repository.getEmployees();
  }
}
