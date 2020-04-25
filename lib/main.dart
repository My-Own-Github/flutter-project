import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'dart:convert';

void main() {
  runApp(
    MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.light()),
    ),
  );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: Text(
          '1Louve Sport',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            // fontStyle: FontStyle.italic
          ),
        ),
        backgroundColorStart: Colors.greenAccent[300],
        backgroundColorEnd: Colors.green[200],
      ),
      body: Center(
        child: Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.5),
                    blurRadius: 20.0, // soften the shadow
                    spreadRadius: 0.0, //extend the shadow
                    offset: Offset(
                      5.0, // Move to right 10  horizontally
                      5.0, // Move to bottom 10 Vertically
                    ),
                  )
                ],
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.white, Colors.limeAccent[200]])),
            child: FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString('load_tournaments/tournaments.json'),
                builder: (context, snapshot) {
                  var myData = json.decode(snapshot.data.toString());
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: myData == null ? 0 : myData.length,
                    itemBuilder: (BuildContext context, int index) =>
                        // Container(
                        //   width: MediaQuery.of(context).size.width,
                        //   padding: EdgeInsets.symmetric(
                        //       horizontal: 10.0, vertical: 5.0),
                        Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 6,
                      color: Colors.transparent,
                      child: Padding(
                        padding: EdgeInsets.all(0),
                        child: Column(
                          children: <Widget>[
                            Row(children: <Widget>[
                              Expanded(
                                  child: Container(
                                      margin: EdgeInsets.fromLTRB(35, 10, 5, 0),
                                      child: Center(
                                        child: Text(
                                          "${myData[index]["name"]}",
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )))
                            ]),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    padding: new EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 10.0),
                                    // color: Color.fromRGBO(198, 65, 144, .7),
                                    decoration: const BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.transparent,
                                          blurRadius: 20.0, // soften the shadow
                                          spreadRadius: 0.0, //extend the shadow
                                          offset: Offset(
                                            5.0, // Move to right 10  horizontally
                                            5.0, // Move to bottom 10 Vertically
                                          ),
                                        )
                                      ],
                                      border: Border(
                                        bottom: BorderSide(
                                          width: 0.5,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                          child: CircleAvatar(
                                            radius: 35,
                                            backgroundImage: ExactAssetImage(
                                              "assets/karate.png",
                                            ),
                                          ),
                                          padding: EdgeInsets.fromLTRB(
                                              0, 0.5, 10, 10),
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Row(
                                                  children: <Widget>[
                                                    Container(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              5, 0, 10, 15),
                                                      child: Image.asset(
                                                        "assets/league.png",
                                                        width: 20,
                                                        height: 20,
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Text(
                                                          "${myData[index]["tournamentType"]["label"]}",
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                              color: Colors
                                                                  .black)),
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              5, 0, 10, 15),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Container(
                                                      child: Text("|",
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              color: Colors
                                                                  .black)),
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              5, 0, 10, 15),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Container(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              5, 0, 10, 15),
                                                      child: Image.asset(
                                                        "assets/cricket.png",
                                                        width: 20,
                                                        height: 20,
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Text(
                                                          "${myData[index]["sport"]["label"]}",
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                              color: Colors
                                                                  .black)),
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              5, 0, 10, 15),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Row(
                                                  children: <Widget>[
                                                    Container(
                                                      child: Text(
                                                          "${myData[index]["startDate"]} to ${myData[index]["endDate"]}",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              color: Colors
                                                                  .black)),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Row(
                                                  children: <Widget>[
                                                    Container(
                                                      child: Text(
                                                          "${myData[index]["contactInfo"]["geoLocation"]["locationText"]}",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              color: Colors
                                                                  .black)),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    // )
                  );
                })),
      ),
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
