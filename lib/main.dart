import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Listview swipe'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class DayOfWeek {
  DayOfWeek(this.id, this.name);

  int id;
  String name;
}

class _MyHomePageState extends State<MyHomePage> {
  List<DayOfWeek> theWeek = [
    DayOfWeek(1, "Monday"),
    DayOfWeek(2, "Tuesday"),
    DayOfWeek(3, "Wednesday"),
    DayOfWeek(4, "Thursday"),
    DayOfWeek(5, "Friday"),
    DayOfWeek(6, "Saturday"),
    DayOfWeek(7, "Sunday"),
  ];

  ListTile _buildTile(String title) {
    return ListTile(
      leading: Icon(Icons.calendar_today),
      title: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: theWeek.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              direction: DismissDirection.startToEnd, //left to right
              key: Key(this.theWeek[index].id.toString()),
              onDismissed: (direction) {
                setState(() {
                  this.theWeek.removeAt(index);
                });
              },
              child: _buildTile(theWeek[index].name),
            );
          },
        ),
      ),
    );
  }
}
