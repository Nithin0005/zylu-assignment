import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/employee_bloc.dart';
import '../bloc/employee_event.dart';
import '../bloc/employee_state.dart';

class EmployeePage extends StatefulWidget {
  const EmployeePage({super.key});

  @override
  State<EmployeePage> createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  @override
  void initState() {
    super.initState();
    context.read<EmployeeBloc>().add(LoadEmployeesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Employees')),
      body: BlocBuilder<EmployeeBloc, EmployeeState>(
        builder: (context, state) {
          if (state is EmployeeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is EmployeeLoaded) {
            return ListView.builder(
              itemCount: state.employees.length,
              itemBuilder: (context, index) {
                final employee = state.employees[index];
                return ListTile(
                  tileColor: employee.isFlagged ? Colors.green.shade200 : null,
                  title: Text(employee.name),
                  subtitle: Text(
                    'Experience: ${employee.experience} yrs | Active: ${employee.isActive}',
                  ),
                  trailing: Text(
                    '${(DateTime.now().difference(employee.joinDate).inDays / 365).toStringAsFixed(1)} yrs',
                  ),
                );
              },
            );
          } else if (state is EmployeeError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
