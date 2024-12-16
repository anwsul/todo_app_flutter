import 'package:flutter/material.dart';
import 'package:todo_app_flutter/widgets/add_todo_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> listOfTodos = [];

  updateTodoList(String todo) {
    setState(() {
      listOfTodos.add(todo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: _buildFloatingActionButton(context),
    );
  }

  ListView _buildBody() {
    // build a ListTile for each todo item
    Widget buildTodoTile(int index) {
      String todo = listOfTodos[index];

      return ListTile(
        title: Text(
          todo,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        trailing: SizedBox(
          width: 100,
          child: Row(
            children: [
              // edit icon
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.edit_outlined,
                  color: Colors.green,
                ),
              ),
              // delete icon
              const Expanded(child: SizedBox()),
              IconButton(
                onPressed: () {
                  setState(() {
                    listOfTodos.removeAt(index);
                  });
                },
                icon: const Icon(
                  Icons.delete_outlined,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return ListView.separated(
      itemCount: listOfTodos.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (_, index) {
        return buildTodoTile(index);
      },
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      toolbarHeight: 100,
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      title: const Text(
        "My Todo List",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  FloatingActionButton _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext _) {
              return AddTodoDialog(onAddTodo: updateTodoList);
            });
      },
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      child: const Icon(Icons.add),
    );
  }
}
