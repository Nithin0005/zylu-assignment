import '../../domain/entities/employee.dart';

class EmployeeModel extends Employee {
  const EmployeeModel({
    required super.id,
    required super.name,
    required super.joinDate,
    required super.isActive,
    required super.experience,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      id: json['id'],
      name: json['name'],
      joinDate: DateTime.parse(json['joining_date']),
      isActive: json['status'] == 'active',
      experience: json['experience'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'joining_date':
          "${joinDate.year.toString().padLeft(4, '0')}-${joinDate.month.toString().padLeft(2, '0')}-${joinDate.day.toString().padLeft(2, '0')}",
      'status': isActive ? 'active' : 'in active',
      'experience': experience,
    };
  }
}
