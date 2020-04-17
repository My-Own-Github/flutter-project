import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.light()),
    ),
  );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My App"),
        backgroundColor: Colors.lightGreen,
        elevation: 0.0,
      ),
      body: SegmentContainer(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Saurabh Mali"),
              currentAccountPicture: CircleAvatar(child: Text("S")),
            ),
            ListTile(
              leading: Icon(Icons.arrow_forward),
              title: Text("About Us"),
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text("My Registrations"),
            ),
            ListTile(
              leading: Icon(Icons.arrow_forward),
              title: Text("Support"),
            ),
            ListTile(
              leading: Icon(Icons.arrow_forward),
              title: Text("Terms & Conditions"),
            ),
            ListTile(
              leading: Icon(Icons.arrow_forward),
              title: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}

class SegmentContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int segmentedControlValue = 0;
    void setState(Null Function() param0) {}
    return Container(
      width: 500,
      child: CupertinoSegmentedControl<int>(
        selectedColor: Colors.blue,
        borderColor: Colors.white,
        children: {
          0: Text('MY EVENTS'),
          1: Text('ALL'),
        },
        onValueChanged: (int val) {
          setState(() {
            segmentedControlValue = val;
          });
        },
        groupValue: segmentedControlValue,
      ),
    );
  }
}
