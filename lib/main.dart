import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final billTextField = TextEditingController();
  final tipTF = TextEditingController();
  final totalTF = TextEditingController();

  bool isSwitched = false;
  double _bill = 0;
  double tip = 0;
  double _total =0;
  double _tipPer = 0.15;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // void toggleSwitch(bool value) {
  //   if(isSwitched == false)
  //   {
  //     setState(() {
  //       isSwitched = true;
  //       _tipPer = 0.2;
  //     });
  //   }
  //   else
  //   {
  //     setState(() {
  //       isSwitched = false;
  //       _tipPer = 0.15;
  //     });
  //   }
  // }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CIS 3334 Tip Calculator 2.0"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Tip Calculator", style: Theme.of(context).textTheme.headlineLarge),
            Text("Bill: "),
            TextField(controller: billTextField),
            ElevatedButton(
                onPressed: ()
                {
                  _bill = double.parse(billTextField.text);
                  tip = _bill * _tipPer;
                  _total = tip + _bill;
                },
                child: Text("Calculate Tip")
            ),
            Switch(
                value: isSwitched,
                onChanged: (value){
                  setState(() {
                    isSwitched = value;
                    _tipPer = 0.2;
                  });
                }
            ),
            Text("Tip: " + tip.toStringAsFixed(2)),
            Text("Total: " + _total.toStringAsFixed(2))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
