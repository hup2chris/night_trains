import 'package:flutter/material.dart';
import 'package:ebpc/screens/hup2.dart';
import 'package:ebpc/utilities/constants.dart';
import 'package:ebpc/screens/books.dart';

final key = 'dest_key';
List<String> destList = [];

class Search extends StatefulWidget {
  static const String id = 'Search';

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  String title = '', author = '', isbn = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        automaticallyImplyLeading: false,
        title: Text('EBook Price Comparison',
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
      body: Container(
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
                child: Text('Enter the name of the ebook, author of the ebook or isbn of '
                    'the ebook and click the search button to find it',
                    style: kSearchTextStyle,),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                    minLeadingWidth: 100.0,
                    leading: Text('Title',
                      style: kListTileTextStyle,),
                    title: TextField(
                      style: kListTileTFTextStyle,
                      //   decoration: kTextFieldInputDecoration,
                      onChanged: (value) {
                        title = value;
                      },
                    )
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                    minLeadingWidth: 100.0,
                    leading: Text('Author(s)',
                      style: kListTileTextStyle,),
                    title: TextField(
                      style: kListTileTFTextStyle,
                      //   decoration: kTextFieldInputDecoration,
                      onChanged: (value) {
                        author = value;
                      },
                    )
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  minLeadingWidth: 100.0,
                    leading: Text('ISBN',
                      style: kListTileTextStyle,),
                    title: TextField(
                      style: kListTileTFTextStyle,
                      //   decoration: kTextFieldInputDecoration,
                      onChanged: (value) {
                        isbn = value;
                      },
                    )
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>
                        Books(title, author, isbn),
                    ),);
                },
                child: Text(
                  'Search',
                  style: kButtonTextStyle2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DestData extends StatelessWidget {

  final String dest;

  DestData({@required this.dest});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5.0),
      child: TextButton(
        onPressed: () {
          Navigator.pop(context, dest);
        },
        child: Text(
          '$dest',
        //  style: kButtonTextStyle,//TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}


class TasksList extends StatelessWidget {
  TasksList(this.cc);

  final List <String> cc;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return DestData(dest: cc[index].toString(),);
    },
      itemCount: cc.length,
    );
  }
}