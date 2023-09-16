import 'package:flutter/material.dart';
import 'package:to_do_list/utils/button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controllerr;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox(
      {super.key,
      required this.controllerr,
      required this.onCancel,
      required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 120,
        child: Column(
          children: [
            TextField(
              controller: controllerr,
              decoration: InputDecoration(
                  hintText: 'Add New Task', border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(title: 'Save', onPressed: onSave),
                SizedBox(
                  width: 6,
                ),
                MyButton(title: 'Cancel', onPressed: onCancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
