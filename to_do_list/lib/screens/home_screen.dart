import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_list/database/db.dart';
import 'package:to_do_list/utils/dialogbox.dart';
import 'package:to_do_list/utils/todolist_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
//if this is the first time you are ever opening theapp
    if (_mybox.get("TODOLIST") == null) {
      db.creatDefaultTasks();
    } else {
      db.loaddata();
    }

    super.initState();
  }

  //referncing the box
  final _mybox = Hive.box('myBox');
  ToDoDataBase db = ToDoDataBase();

  TextEditingController _controller = TextEditingController();

  void checkBox(int index, bool? value) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text(
          'TO Do List',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: db.todoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              deleteTask: (context) {
                deleteTaskk(index);
              },
              title: db.todoList[index][0],
              onCompleted: db.todoList[index][1],
              onChanged: (value) {
                checkBox(index, value);
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showbox();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void showbox() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controllerr: _controller,
            onCancel: () {
              Navigator.of(context).pop();
            },
            onSave: () {
              saveTask();
            },
          );
        });
  }

  void saveTask() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  void deleteTaskk(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDatabase();
  }
}
