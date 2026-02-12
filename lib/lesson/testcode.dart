import 'package:flutter/material.dart';
abstract class ButtonListener {
  void onClickButton (int newButton);
}

class ButtonStation {
  int clickButton;
  final List<ButtonListener> _listener = [];

  ButtonStation({this.clickButton = 0});
  void addListener(ButtonListener listener) {
    _listener.add(listener);
  }

  void setButton (int setButton) {
    if (setButton != clickButton){
      clickButton = setButton;
      _notifyListener();
    }
  }

  void _notifyListener() {
    for (ButtonListener listener in _listener){
      listener.onClickButton(clickButton);
    }
  }
}

class Button extends ButtonListener {
    Button(this.myButtonStation) {
      myButtonStation.addListener(this);
    }

    final ButtonStation myButtonStation;
    
      @override
      void onClickButton(int newButton) {
    // TODO: implement onClickButton
        print("Button pressed");
    }
}





void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Home()),
    ),
  );
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> implements ButtonListener {
  late ButtonStation buttonStation;
  int counter = 0;

  @override
  void initState() {
    super.initState();
    buttonStation = ButtonStation();
    buttonStation.addListener(this);
  }

  void _pressButton() {
    counter++;
    buttonStation.setButton(counter);
  }

  @override
  void onClickButton(int newButton) {
    print("Button pressed. Current value: $newButton");
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: _pressButton,
        child: const Text("Touch me"),
      ),
    );
  }
}

