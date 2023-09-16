import 'package:hive/hive.dart';

class ToDoDataBase {
  List todoList = [];

  //refer to box
  final _mybox = Hive.box('mybox');

  //run this method if this is the first time ever user opening the app
  void creatDefaultTasks() {
    todoList = [
      ['Submit Application', false],
      ['Go to Gym', false],
      ['Build Apps', false]
    ];
  }

  //load the data
  void loaddata() {
    todoList = _mybox.get('TODOLIST');
  }

  //update the database
  void updateDatabase() {
    _mybox.put('TODOLIST', todoList);
  }
}
