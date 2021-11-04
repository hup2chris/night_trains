import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ebpc/screens/hup2.dart';
import 'package:ebpc/utilities/book_data.dart';
import 'package:ebpc/screens/prices.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ebpc/utilities/constants.dart';

Color logIn = Colors.blueGrey;//Colors.lightBlue;

class Books extends StatefulWidget {
  static const String id = 'Books';
  final String title, author, isbn;

  Books(this.title, this.author, this.isbn);

  @override
  _BooksState createState() => _BooksState();
}

class _BooksState extends State<Books> {
  String selectedCurrency = 'USD';

  //String value = '?';
  Map value = {};
  var valueData = {};
  String loaded = 'No';

  void getData() async {

    try {
      //Map data = await CoinData().getCoinData(selectedCurrency);
      var data = await BooksData().getBookData(widget.title, widget.author, widget.isbn);
      //print(data.keys);
      //print(data.toString());
      setState(() {
        valueData = data;
      /*  String cUser;// = CoinData().getCurrentUser();
        // print('cUser is ${cUser.toString()}');
        if(cUser != null){
          logIn = Colors.blueGrey;
        }*/
      /*  print(valueData.toString());
        //print(value[cryptoList[1]]);*/

        loaded = 'Yes';
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  List <CryptoCard> getCryptoCard() {
    List <CryptoCard> cc = [];

    int arrlength = 0;

    arrlength = 'saleability'.allMatches(valueData.toString()).length;
    //print('arrlength is $arrlength');

    //for (int i = 0; i < cryptoList.length; i++) {
    for(int i = 0; i < arrlength; i++) {

      if ( valueData['items'][i]['saleInfo']['saleability'] == 'FOR_SALE') {
        //cc.add(CryptoCard(value: value.isEmpty ? '?' : value[cryptoList[0]], selectedCurrency: selectedCurrency, cryptoCurrency: cryptoList[0],));
        if (valueData.isNotEmpty) {
          cc.add(CryptoCard(title: valueData['items'][i]['volumeInfo']['title'],
            author: '${valueData['items'][i]['volumeInfo']['authors'].join("," + " ")}',
            isbn: valueData['items'][i]['volumeInfo']['industryIdentifiers'][0]['identifier'],
            link: valueData['items'][i]['volumeInfo']['imageLinks']['smallThumbnail'].replaceAll("http", "https"),
            price: valueData['items'][i]['saleInfo']['listPrice']['amount'].toString()
          ));
        }
     /*   else {
          cc.add(CryptoCard(value: value.isEmpty ? '?' : value[cryptoList[i]],
            selectedCurrency: selectedCurrency,
            cryptoCurrency: 'i',
            //cryptoList[i],
            //day1: arrow.isEmpty ? "75d ⌃" : "${arrow[cryptoList[i]]}d ⌃",
            day1: "d ⌃",
            num: 0,));
        }*/
        //  print('days are ${arrow[cryptoList[i]]}⌃');
      }
    }
    return cc;
  }

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          /*Column(
            children: /*[
              CryptoCard(value: value.isEmpty ? '?' : value[cryptoList[0]], selectedCurrency: selectedCurrency, cryptoCurrency: cryptoList[0],),
              CryptoCard(value: value.isEmpty ? '?' : value[cryptoList[1]], selectedCurrency: selectedCurrency, cryptoCurrency: cryptoList[1],),
              CryptoCard(value: value.isEmpty ? '?' : value[cryptoList[2]], selectedCurrency: selectedCurrency, cryptoCurrency: cryptoList[2],),
              CryptoCard(value: value.isEmpty ? '?' : value[cryptoList[3]], selectedCurrency: selectedCurrency, cryptoCurrency: cryptoList[3],),
            ]*/getCryptoCard(),
          ),*/
         /* SizedBox(
            height: 50.0,
          ),*/
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
            child: Text('Click on the ebook below that you wish to retrieve prices for.',
              style: kSearchTextStyle,),
          ),
          Expanded(child: Container(
           // padding: EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                )
            ),
            child: loaded != 'Yes' ? SpinKitChasingDots(
              color: Colors.blueGrey,
              size: 100.0,) : TasksList(getCryptoCard()),
          )),
        ],
      ),
    );
  }
}

class CryptoCard extends StatelessWidget {
  CryptoCard({@required this.title, @required this.author, @required this.isbn,
    @required this.link, @required this.price});

  final String title;
  final String author;
  final String isbn;
  final String link;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0),
      child: Card(
        color: logIn, //Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) =>
                    Prices(title, author, isbn, link, price
                       ),
                ),);
            },
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children : [ Expanded(
                  child: Text(
                    '$title\n $author\n $isbn',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                  ),
                ),/*Text(
                  '$link',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10.0,
                    color: Colors.redAccent,
                  ),
                ),*/
                  Image.network(
                    '$link',
                    width: MediaQuery.of(context).size.width/3,
                    height: MediaQuery.of(context).size.height/10,
                    fit: BoxFit.contain,
                  ),
                ]
            ),
          ),
        ),
      ),
    );
  }
}

class TasksList extends StatelessWidget {
  //final List<String> items = List<String>.generate(10000, (i) => "Item $i");

  TasksList(this.cc);

  final List <CryptoCard> cc;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return CryptoCard(title: cc[index].title, author: cc[index].author,
        isbn: cc[index].isbn, link: cc[index].link, price: cc[index].price);
    },
      itemCount: cc.length,
    );
  }
}


/*import 'package:flutter/material.dart';
import 'package:ebpc/screens/hup2.dart';
import 'package:ebpc/utilities/constants.dart';

final key = 'dest_key';
List<String> destList = [];

class Books extends StatefulWidget {
  static const String id = 'Books';
  final String title, author, isbn;

  Books(this.title, this.author, this.isbn);

  @override
  _BooksState createState() => _BooksState();
}

class _BooksState extends State<Books> {

  String cityName;

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
        padding: EdgeInsets.all(25.0),
        alignment: Alignment.center,
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                        children: <Widget>[
                          Text(widget.title == null ? '' : widget.title,
                            style: kListTileTextStyle,),
                          Text(widget.author == null ? '' : widget.author,
                            style: kListTileTextStyle,),
                          Text(widget.isbn == null ? '' : widget.isbn,
                            style: kListTileTextStyle,),]),
                    Image.network(
                      'https://hup2.com/ebpc/icons/ebpc_512.png',
                      width: MediaQuery.of(context).size.width/6,
                      height: MediaQuery.of(context).size.height/6,
                      fit: BoxFit.contain,
                    ),
                  ]
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
}*/