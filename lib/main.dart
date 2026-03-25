import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'features/employee/data/datasources/employee_remote_data_source.dart';
import 'features/employee/data/repositories/employee_repository_impl.dart';
import 'features/employee/domain/usecases/get_employees.dart';
import 'features/employee/presentation/bloc/employee_bloc.dart';
import 'features/employee/presentation/pages/employee_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final client = http.Client();
  final dataSource = EmployeeRemoteDataSourceImpl(client);
  final repository = EmployeeRepositoryImpl(dataSource);
  final getEmployees = GetEmployees(repository);

  runApp(MyApp(getEmployees: getEmployees));
}

class MyApp extends StatelessWidget {
  final GetEmployees getEmployees;

  const MyApp({super.key, required this.getEmployees});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Employee App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider(
        create: (_) => EmployeeBloc(getEmployees: getEmployees),
        child: const EmployeePage(),
      ),
    );
  }
}
