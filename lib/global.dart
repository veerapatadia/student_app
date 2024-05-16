import 'dart:io';

import 'package:studentapp/model/student.dart';

class Global {
  static String name = "";
  static String grid = "";
  static String std = "";

  static List<Student> allStudent = [];
  static Student? selectedStudent;

  static File? profileImageFile;
}
