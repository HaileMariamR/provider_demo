import 'package:flutter/material.dart';
import 'main_provider.dart';
import 'package:provider/provider.dart';

class TextDemo extends StatefulWidget {
  const TextDemo({Key? key}) : super(key: key);

  @override
  _TextDemoState createState() => _TextDemoState();
}

class _TextDemoState extends State<TextDemo> {
  var mycontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<MyAppState>(context);
    return Container(
      child: Column(
        children: [
          Text("${appState.getTextValue}"),
          TextField(
            controller: mycontroller,
            onChanged: (value) => appState.setTextValue(value),
          ),
        ],
      ),
    );
  }
}
