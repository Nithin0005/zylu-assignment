import 'package:equatable/equatable.dart';

class Employee extends Equatable {
  final String id;
  final String name;
  final DateTime joinDate;
  final bool isActive;
  final int experience;

  const Employee({
    required this.id,
    required this.name,
    required this.joinDate,
    required this.isActive,
    required this.experience,
  });

  bool get isFlagged {
    final now = DateTime.now();
    final difference = now.difference(joinDate);
    final years = difference.inDays / 365;
    return isActive && years > 5;
  }

  @override
  List<Object?> get props => [id, name, joinDate, isActive, experience];
}
