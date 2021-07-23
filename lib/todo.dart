import 'package:flutter/material.dart';
import 'main_provider.dart';
import 'package:provider/provider.dart';
import 'Edit.dart';

class Todo extends StatefulWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  var mycontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<MyAppState>(context);
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: TextField(
                controller: mycontroller,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: "Enter Your task here!",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                )),
          ),
          SizedBox(
            height: 10,
          ),
          (appState.getisTodEditing == false)
              ? ElevatedButton(
                  onPressed: () => {
                        appState.addTodo(mycontroller.text.toString()),
                      },
                  child: Text("Create Task"))
              : Text(""),
          Container(
            height: 300,
            child: ListView(
              children: appState.getAlltodos
                  .map((todo) => ListTile(
                      leading: Text("$todo"),
                      trailing: Container(
                        width: 80,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                appState.setisEditing(true);
                                mycontroller.value = TextEditingValue(
                                  text: todo,
                                );
                              },
                              child: (appState.getisTodEditing == true)
                                  ? GestureDetector(
                                      onTap: () {
                                        appState.editTodo(
                                            todo, mycontroller.text);
                                        appState.setisEditing(false);
                                      },
                                      child: Icon(Icons.update))
                                  : Icon(
                                      Icons.edit,
                                      color: Colors.blue,
                                    ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                                onTap: () {
                                  appState.removeTodo(todo);
                                },
                                child: Icon(Icons.delete, color: Colors.red)),
                          ],
                        ),
                      )))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
