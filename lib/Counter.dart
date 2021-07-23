import 'package:flutter/material.dart';
import 'main_provider.dart';
import 'package:provider/provider.dart';

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<MyAppState>(context);

    return Container(
      child: Column(
        children: [
          Container(child: Text("${appState.getCount}")),
          Row(
            children: [
              MaterialButton(
                onPressed: () {
                  appState.increament();
                },
                child: Text("+"),
              ),
              MaterialButton(
                onPressed: () {
                  appState.reset();
                },
                child: Text("reset"),
              ),
              MaterialButton(
                onPressed: () {
                  appState.decrement();
                },
                child: Text("-"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
