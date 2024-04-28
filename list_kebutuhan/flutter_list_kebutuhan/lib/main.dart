import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Checklist Kebutuhan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChecklistPage(),
    );
  }
}

class ChecklistPage extends StatefulWidget {
  @override
  _ChecklistPageState createState() => _ChecklistPageState();
}

class _ChecklistPageState extends State<ChecklistPage> {
  List<String> items = ['tenda', 'senter', 'sandal', 'Penggaris', 'payung'];
  List<bool> isCheckedList = [];

  @override
  void initState() {
    super.initState();
    isCheckedList = List<bool>.filled(items.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checklist Kebutuhan'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return CheckboxListTile(
            title: Text(items[index]),
            value: isCheckedList[index],
            onChanged: (value) {
              setState(() {
                isCheckedList[index] = true;
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isCheckedList = List<bool>.filled(items.length, false);
          });
        },
        tooltip: 'Reset',
        child: Icon(Icons.refresh),
      ),
    );
  }
}
