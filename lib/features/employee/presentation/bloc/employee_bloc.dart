import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/usecase.dart';
import '../../domain/usecases/get_employees.dart';
import 'employee_event.dart';
import 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final GetEmployees getEmployees;

  EmployeeBloc({required this.getEmployees}) : super(EmployeeInitial()) {
    on<LoadEmployeesEvent>(_onLoadEmployeesEvent);
  }

  Future<void> _onLoadEmployeesEvent(
    LoadEmployeesEvent event,
    Emitter<EmployeeState> emit,
  ) async {
    emit(EmployeeLoading());
    try {
      final employees = await getEmployees(NoParams());
      emit(EmployeeLoaded(employees: employees));
    } catch (e) {
      emit(EmployeeError(message: e.toString()));
    }
  }
}
