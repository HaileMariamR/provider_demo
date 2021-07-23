import 'package:flutter/material.dart';
import 'package:provider_demo/todo.dart';
import 'main_provider.dart';
import 'package:provider/provider.dart';

class Edit extends StatefulWidget {
  Edit({required this.value});
  final value;
  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  @override
  Widget build(BuildContext context) {
    var mycontroller = TextEditingController(text: widget.value);
    var appState = Provider.of<MyAppState>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back)),
        ),
        body: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: TextField(
                    maxLines: null,
                    controller: mycontroller,
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
              ElevatedButton(
                  onPressed: () => {
                        appState.editTodo(widget.value, mycontroller.text),
                        Navigator.pop(context),
                      },
                  child: Text("Edit Todo")),
            ],
          ),
        ),
      ),
    );
  }
}
