import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google I/O Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final TextEditingController _inputController = TextEditingController();
  List<String> groceries = ["Cooking Oil"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grocery List App"),
      ),
      body: Column(
        children: [
          //TextField
          Container(
            margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
              width: MediaQuery.of(context).size.width,
              child: TextField(
                controller: _inputController,
              )),
          //Grocery
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 50,
                  child: ElevatedButton(onPressed: (){
                    String newGrocery = _inputController.text.toString();

                    if(newGrocery.isNotEmpty) {
                      groceries.add(newGrocery);
                    }

                    _inputController.clear();
                    setState(() {

                    });
                  }, child: const Text("Add New Item"),),
                ),
                SizedBox(
                  height: 50,
                  child: OutlinedButton(onPressed: (){
                    setState(() {
                      groceries.clear();
                    });
                  }, child: const Text("Clear List"),),
                ),
              ],
            ),
          ),
          //ListOfGroceries
          Expanded(
            child: ListView.builder(
                itemCount: groceries.length,
                itemBuilder: (context, index) {
                  String _grocery = groceries[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      child: Text(_grocery));
                }),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
