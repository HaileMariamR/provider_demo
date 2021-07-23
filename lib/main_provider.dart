import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAppState extends ChangeNotifier {
  int _count = 0;
  String _textValue = "";
  bool _isEditing = false;

  bool get getisTodEditing => _isEditing;
  List<String> _todos = [];
  List<String> get getAlltodos => _todos;

  void setisEditing(bool value) {
    _isEditing = value;
    notifyListeners();
  }

  void editTodo(String oldvalue, String newValue) {
    int indexofTodo = _todos.indexOf(oldvalue);
    _todos[indexofTodo] = newValue;
    notifyListeners();
  }

  void removeTodo(String todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  void addTodo(String input) {
    _todos.add(input);
    notifyListeners();
  }

  void increament() {
    _count += 1;
    notifyListeners();
  }

  void decrement() {
    _count -= 1;
    notifyListeners();
  }

  void reset() {
    _count = 0;
    notifyListeners();
  }

  void setTextValue(String input) {
    _textValue = input;
    notifyListeners();
  }

  String get getTextValue => _textValue;
  int get getCount => _count;
}
