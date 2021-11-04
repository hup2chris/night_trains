import 'package:ebpc/screens/hup2.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  static const String id = 'MainScreen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          automaticallyImplyLeading: false,
          title: Text('Computer Games Price Comparison',
            style: TextStyle(
              fontFamily: 'Balsamiq Sans',
              fontSize: 23.0,
              color: Color(0xFFCFD8DC),
              fontWeight: FontWeight.bold,
            ),),
          actions: [
            PopupMenuButton(
              color: Color(0xFFCFD8DC),
              itemBuilder: (BuildContext bc) => [
                PopupMenuItem(child: Text("Search"), value: "Search"),
                PopupMenuItem(child: Text("Football League Tables"), value: "FLT"),
                PopupMenuItem(child: Text("Horse Racing Tables"), value: "HRT"),
                PopupMenuItem(child: Text("Hup2"), value: "Hup2"),
              ],
              onSelected: (route) {
                if(route == 'Hup2')
                  Hup2().launchPage();
                else if(route == 'FLT')
                  FLT().launchPage();
                else if(route == 'HRT')
                  HRT().launchPage();
                else
                  Navigator.pushNamed(context, route);
              },
            ),//actions widget in appbar
          ],
        ),
        backgroundColor: Colors.white,
        body: OrientationBuilder(
    builder: (context, orientation) {
    return SafeArea(
        child: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
          Image.network(
            'https://hup2.com/ebpc/icons/ebpc_512.png',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.contain,
          ),
          Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(orientation == Orientation.portrait ? 25.0 : 5.0),
                  alignment: Alignment.center,
                  child: Text(
                    'On CGPC you can search for computer games and any ebooks that match your search are returned.\n\n'
                  'If you select one of the results you will be shown prices for that particular book at '
                    'various websites.\n\n'
                  'If you feel the prices shown are too much at the moment you can save the game for later'
                  'if you sign in with your google account\n\n'
                      'CGPC will check the prices daily of the game(s) you saved and if cheaper, '
                        'will email you at your google account.\n\n'
                'If you click the subscribe button above you with also get a noification of any cheaper books '
                    'along with your email.\n\n'
                'CGPC only store your google details necessary to uniquely identifiy you and to email you of '
                    'price reductions\n\n'
                'You will not be contacted for any other reason and your details will not be passed on to '
                    'anybody else.\n\n'
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
                  padding: EdgeInsets.all(orientation == Orientation.portrait ? 25.0 : 5.0),
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
    }
        ),
      );
  }
}