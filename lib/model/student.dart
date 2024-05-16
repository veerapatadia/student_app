import 'dart:io';

class Student {
  String name;
  String grid;
  String std;
  File? profileImageFile;

  Student({
    required this.name,
    required this.grid,
    required this.std,
    required this.profileImageFile,
  });
}
