import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  //List<List<dynamic>> toDoList = [];
   List toDoList = [];
  final _myBox = Hive.box('mybox');

  void createInitialData() {
    toDoList = [
      ["Shopping", false],
      ["Sleep", true],
    ];
  }

  void loadData() {
    try {
      toDoList = _myBox.get("TODOLIST") ?? [];
      print("Loaded data: $toDoList");
    } catch (e) {
      print("Error loading data: $e");
    }
  }

  void updateDataBase() {
    try {
      _myBox.put("TODOLIST", toDoList);
      print("Updated data: $toDoList");
    } catch (e) {
      print("Error updating data: $e");
    }
  }
}
