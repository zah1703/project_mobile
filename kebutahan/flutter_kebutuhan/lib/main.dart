import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Checklist Barang',
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
  List<String> items = [
    'Pensil',
    'Buku',
    'Penghapus',
    'Penggaris',
    'Pensil Warna'
  ];
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
        title: Text('Checklist Barang'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return CheckboxListTile(
            title: Text(items[index]),
            value: isCheckedList[index],
            onChanged: (bool value) {
              setState(() {
                isCheckedList[index] = value;
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
