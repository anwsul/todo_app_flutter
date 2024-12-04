import 'package:flutter/material.dart';

class AddTodoDialog extends StatefulWidget {
  Function onAddTodo;
  AddTodoDialog({super.key, required this.onAddTodo});

  @override
  State<AddTodoDialog> createState() => _AddTodoDialogState();
}

class _AddTodoDialogState extends State<AddTodoDialog> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // title
      title: const Text(
        "Add Todo",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),

      // content
      content: SizedBox(
        width: 400,
        child: _buildTextField(),
      ),

      // actions
      actions: [_addTodoItem(context)],
    );
  }

  TextField _buildTextField() {
    return TextField(
      controller: controller,

      // decoration
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),

        // when the textfield is focused
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Colors.black,
            width: 2,
          ),
        ),
      ),
    );
  }

  ElevatedButton _addTodoItem(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
      ),
      onPressed: () {
        widget.onAddTodo(controller.text);
        Navigator.pop(context);
      },
      child: const Text(
        "Add",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
