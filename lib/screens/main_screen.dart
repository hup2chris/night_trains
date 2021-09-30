import 'package:night_trains/screens/hup2.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  static const String id = 'MainScreen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // this dummy data will be displayed in the table
  final List<Map> _users = [
    {
      'id': 'id',
      'name': 'Route',
      'op': 'Service',
      'stops': 'Stops',
      'miles': 'Miles',
    },
    {
      'id': 1,
      'name': 'Barcelona - A Coruña',
      'op': 'TrenHotel Galicia',
      'stops': 4,
      'miles': 1,
    },
    {
      'id': 2,
      'name': 'Barcelona - Vigo',
      'op': 'TrenHotel Galicia',
      'stops': 4,
      'miles': 1,
    },
    {
      'id': 3,
      'name': 'Trump',
      'op': 'Service',
      'stops': 1,
      'miles': 1,
    },
    {
      'id': 4,
      'name': 'Joe Biden',
      'op': 'Service',
      'stops': 1,
      'miles': 1,
    },
    {
      'id': 5,
      'name': 'Superman',
      'op': 'Service',
      'stops': 1,
      'miles': 1,
    },
    {
      'id': 6,
      'name': 'Wonder Lady',
      'op': 'Service',
      'stops': 1,
      'miles': 1,
    },
    {
      'id': 7,
      'name': 'Ronaldo',
      'op': 'Service',
      'stops': 1,
      'miles': 1,
    },
    {
      'id': 8,
      'name': 'Ben',
      'op': 'Service',
      'stops': 1,
      'miles': 1,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        automaticallyImplyLeading: false,
        title: Text(
          'European Night Trains',
          style: TextStyle(
            fontFamily: 'Balsamiq Sans',
            fontSize: 23.0,
            color: Color(0xFFCFD8DC),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          PopupMenuButton(
            color: Color(0xFFCFD8DC),
            itemBuilder: (BuildContext bc) => [
              PopupMenuItem(child: Text("Search"), value: "Search"),
              PopupMenuItem(
                  child: Text("Football League Tables"), value: "FLT"),
              PopupMenuItem(child: Text("Horse Racing Tables"), value: "HRT"),
              PopupMenuItem(child: Text("Hup2"), value: "Hup2"),
            ],
            onSelected: (route) {
              if (route == 'Hup2')
                Hup2().launchPage();
              else if (route == 'FLT')
                FLT().launchPage();
              else if (route == 'HRT') HRT().launchPage();
              //  else
              // Navigator.pushNamed(context, route);
            },
          ), //actions widget in appbar
        ],
      ),
      backgroundColor: Colors.white,
      body: OrientationBuilder(builder: (context, orientation) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: SingleChildScrollView(
                        child: Table(
                          columnWidths: {
                            // 0: FixedColumnWidth(50),
                            0: FlexColumnWidth(2),
                            1: FlexColumnWidth(2),
                            2: FlexColumnWidth(1),
                            3: FlexColumnWidth(1),
                          },
                          children: _users.map((user) {
                            return TableRow(children: [
                              /* Container(
                      color: _users.indexOf(user) % 2 == 0
                          ? Colors.blue[50]
                          : Colors.amber[50],
                      padding: EdgeInsets.all(15),
                      child: Text(user['id'].toString())),*/
                              Container(
                                  color: _users.indexOf(user) % 2 == 0
                                      ? Colors.blue[50]
                                      : Colors.amber[50],
                                  padding: EdgeInsets.all(15),
                                  child: Text(user['name'].toString())),
                              Container(
                                  color: _users.indexOf(user) % 2 == 0
                                      ? Colors.blue[50]
                                      : Colors.amber[50],
                                  padding: EdgeInsets.all(15),
                                  child: Text(user['op'].toString())),
                              Container(
                                  color: _users.indexOf(user) % 2 == 0
                                      ? Colors.blue[50]
                                      : Colors.amber[50],
                                  padding: EdgeInsets.all(15),
                                  child: Text(user['stops'].toString())),
                              Container(
                                  color: _users.indexOf(user) % 2 == 0
                                      ? Colors.blue[50]
                                      : Colors.amber[50],
                                  padding: EdgeInsets.all(15),
                                  child: Text(user['miles'].toString()))
                            ]);
                          }).toList(),
                          border:
                              TableBorder.all(width: 1, color: Colors.black),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(
                          orientation == Orientation.portrait ? 25.0 : 5.0),
                      alignment: Alignment.center,
                      child: Text(
                        'Hope you enjoy the site. 🙂',
                        style: TextStyle(
                          fontFamily: 'Balsamiq Sans',
                          fontSize: 17.0,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(
                          orientation == Orientation.portrait ? 25.0 : 5.0),
                      child: Text(
                        'Copyright © Hup2 2021.',
                        style: TextStyle(
                          fontFamily: 'Balsamiq Sans',
                          fontSize: 17.0,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
