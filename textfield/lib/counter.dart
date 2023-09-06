import 'package:flutter/material.dart';

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  int counter = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Counter App'),
          backgroundColor: Colors.deepPurple,
        ),
        body: Column(
          children: [
            Text(
              "Counter $counter",
              style: TextStyle(fontSize: 40),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  counter++;
                });
                // print(counter);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple,
              ),
              child: const Text('Add Value'),
            )
          ],
        ));
  }
}
