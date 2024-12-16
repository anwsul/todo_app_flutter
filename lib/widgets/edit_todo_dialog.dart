import 'package:flutter/material.dart';

class EditTodoDialog extends StatefulWidget {
  final String currentValue;
  final int index;
  final Function onEditTodo;

  const EditTodoDialog({
    super.key,
    required this.currentValue,
    required this.index,
    required this.onEditTodo,
  });

  @override
  State<EditTodoDialog> createState() => _EditTodoDialogState();
}

class _EditTodoDialogState extends State<EditTodoDialog> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller.text = widget.currentValue;
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
        "Edit Todo",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),

      // content
      content: SizedBox(
        width: 400,
        child: _buildTextField(),
      ),

      // actions
      actions: [_editTodoItem(context)],
    );
  }

  TextField _buildTextField() {
    return TextField(
      controller: controller,
      autofocus: true,
      onSubmitted: (value) {
        widget.onEditTodo(widget.index, value);
        Navigator.pop(context);
      },

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

  ElevatedButton _editTodoItem(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
      ),
      onPressed: () {
        widget.onEditTodo(widget.index, controller.text);
        Navigator.pop(context);
      },
      child: const Text(
        "Done",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
