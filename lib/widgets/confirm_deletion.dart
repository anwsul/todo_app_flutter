import 'package:flutter/material.dart';

class ConfirmDeletion extends StatelessWidget {
  final int index;
  final Function onDeleteTodo;
  const ConfirmDeletion({
    required this.index,
    required this.onDeleteTodo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        // title
        title: const Text(
          "Delete Confirmation",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),

        // content
        content: const SizedBox(
          width: 400,
          child: Text("Are you sure you want to delete this todo?"),
        ),

        // actions
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
            child: const Text(
              "Cancel",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              onDeleteTodo(index);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: const Text(
              "Delete",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ]);
  }
}
