import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Callback Example')),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              processNumbers(5, (index) {
                print('Button pressed: Index $index');
              });
            },
            child: Text('Press Me'),
          ),
        ),
      ),
    );
  }
}

void processNumbers(int count, Function(int index) callback) {
  for (var i = 0; i < count; i++) {
    callback(i); // Invoke the callback with the current index
  }
}
