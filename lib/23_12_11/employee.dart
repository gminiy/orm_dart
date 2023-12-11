import 'dart:convert';
import 'dart:io';

class Employee {
  String name;
  int age;

  Employee({
    required this.name,
    required this.age,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
    };
  }

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      name: json['name'],
      age: json['age'],
    );
  }
}

class Department {
  String name;
  Employee leader;
  List<Employee> employees;

  Department(
      {required this.name, required this.leader, required this.employees});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'leader': leader.toJson(),
      'employees': employees.map((employee) => employee.toJson()).toList(),
    };
  }

  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(
      name: json['name'],
      leader: Employee.fromJson(json['leader']),
      employees: (json['employees'] as List<dynamic>)
          .map((e) => Employee.fromJson(e))
          .toList(),
    );
  }
}

void main() {
  // Employee 인스턴스 생성
  Employee leader = Employee(name: '연지민', age: 41);
  Employee employee1 = Employee(name: '똘마니1', age: 43);
  Employee employee2 = Employee(name: '똘마니2', age: 42);

  // Department 인스턴스 생성
  Department department = Department(
      name: '개발팀', leader: leader, employees: [employee1, employee2]);

  // JSON 직렬화
  String leaderJson = jsonEncode(leader);
  String departmentJson = jsonEncode(department);

  // 파일에 JSON 결과 출력
  final String currentDir = Directory(Platform.script.toFilePath()).parent.path;
  File file = File('$currentDir/company.txt');
  file.writeAsStringSync(
      'Leader:\n$leaderJson\n\nDepartment:\n$departmentJson');
  print('직렬화된 데이터가 company.txt 파일에 저장되었습니다.');

  // fromJson 테스트
  final json = department.toJson();
  final Department departmentFromJson = Department.fromJson(json);
  print(departmentFromJson.toJson());
}
