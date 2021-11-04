import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ebpc/screens/hup2.dart';
import 'package:ebpc/utilities/book_data.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Color logIn = Colors.blueGrey;

class Prices extends StatefulWidget {
  static const String id = 'Books';
  final String title, author, isbn, link, price;

  Prices(this.title, this.author, this.isbn, this.link, this.price);

  @override
  _PricesState createState() => _PricesState();
}

class _PricesState extends State<Prices> {
  String selectedCurrency = 'USD';

  //String value = '?';
  Map value = {};
  var valueData = {};
  var valueHiveData;
  int hnofind = -1, knofind = -1;
  String hbuyLink, hamount, valueKoboData, kbuyLink, kamount;
  List <PricesCard> cc = [];
  String loaded = 'No';

  void getData() async {

    try {
      //Map data = await CoinData().getCoinData(selectedCurrency);
   //   var hivedata = await BooksData().getHiveData(widget.isbn);
      var kobodata = await BooksData().getKoboData(widget.isbn);
   //   print(hivedata);
      setState(() {

        cc.add(PricesCard(shop: 'Google',
                          price: '${widget.price}',
                          link: widget.link,
              ));

      /*  valueHiveData = hivedata;
       // hbuyLink = hivedata;

      //  print(valueHiveData);

        hnofind = valueHiveData.toString().indexOf('t find any results for');

        hbuyLink = "https://www.hive.co.uk/Search/Keyword?keyword=" +
            widget.isbn.replaceAll(" ", "+");

        hamount = valueHiveData.toString().substring(valueHiveData.toString().indexOf('itemprop="price" content="')+26,
            valueHiveData.toString().indexOf('itemprop="price" content="')+26 + valueHiveData.toString().substring(
                valueHiveData.toString().indexOf('itemprop="price" content="')+26).indexOf(">")-1);
*/
        hamount = kobodata['hamount'];

        hbuyLink = kobodata['hbuyLink'];



       // if (hnofind < 0) {
        if (hamount?.isNotEmpty ?? false) {
          cc.add(PricesCard(shop: 'Hive',
                            price: hamount,
                            link: hbuyLink,
          ));
        }

      /*  valueKoboData = kobodata;
        // hbuyLink = hivedata;

        //  print(valueHiveData);
        knofind = valueKoboData.indexOf('did not return any results');

        kbuyLink = "https://www.kobo.com/gb/en/search?hreflang=en-gb&query=" +
            widget.isbn.replaceAll(" ", "+");

        kamount = valueKoboData.substring(valueKoboData.indexOf('og:price')+19,
            valueKoboData.indexOf('og:price')+19 +
                valueKoboData.substring(valueKoboData.indexOf('og:price')+19).indexOf(">")-2
        );
*/
        kamount = kobodata['kamount'];

        kbuyLink = kobodata['kbuyLink'];

        //if (knofind < 0) {
        if (kamount?.isNotEmpty ?? false) {
          cc.add(PricesCard(shop: 'Kobo', price: kamount, link: kbuyLink,));
        }

      //  print('$hnofind $hbuyLink $hamount');

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
          cc.add(CryptoCard(title: widget.title,            author: widget.author,
            isbn: widget.isbn,            link: widget.link,
          ));
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
       // mainAxisAlignment: MainAxisAlignment.center,
       // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
        SizedBox(
            height: 50.0,
          ),
          Card(
            color: logIn, //Colors.lightBlueAccent,
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children : [ Expanded(
              child: Text(
                '${widget.title}\n ${widget.author}\n ${widget.isbn}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                ),
              ),
            ),
              Image.network(
                widget.link,
                width: MediaQuery.of(context).size.width/3,
                height: MediaQuery.of(context).size.height/10,
                fit: BoxFit.contain,
              ),
            ]
        ),
            ),
    ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            'Click on one of the shops below to be taken there to buy the ebook.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.blueGrey,
            ),
          ),
          Padding(
      padding: EdgeInsets.only(top: 40.0, left: 50.0, right: 50.0, bottom: 10.0),
      child:
      Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
         // crossAxisAlignment: CrossAxisAlignment.center,
          children : [
            Text(
              'Shop',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.redAccent,
              ),
            ),
            Text(
              'Prices',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.redAccent,
              ),
            ),
          ]),
          ),
       /*   Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.0),
            child:
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children : [
                  Text(
                    'Google',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.blueGrey,
                    ),
                  ),
                  Text(
                    '£${widget.price}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.blueGrey,
                    ),
                  ),
                ]),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.0),
            child:
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children : [
                  Text(
                    'Hive',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.blueGrey,
                    ),
                  ),
                  Text(
                    '£$hamount',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.blueGrey,
                    ),
                  ),
                ]),
          ),*/
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
              size: 100.0,) : TasksList(cc),
          ),),
         /* Padding(
            padding: EdgeInsets.only(top: 40.0, left: 50.0, right: 50.0, bottom: 10.0),
            child:*/
              //  ),
       /*    SizedBox(
            height: 50.0,
          ),
          Expanded(child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                )
            ),
            child: CryptoCard(title: widget.title, author: widget.author,
              isbn: widget.isbn, link: widget.link,)//TasksList(getCryptoCard()),
          )),
          Expanded(child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                )
            ),
            child:
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children : [
                  Text(
                    'Shop',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 50.0,
                      color: Colors.redAccent,
                    ),
                  ),
                  Text(
                    'Prices',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 50.0,
                      color: Colors.redAccent,
                    ),
                  ),
                ]),
          )),*/
        ],
      ),
    );
  }
}

class CryptoCard extends StatelessWidget {
  CryptoCard({@required this.title, @required this.author, @required this.isbn,
    @required this.link});

  final String title;
  final String author;
  final String isbn;
  final String link;

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
              ),
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
    );
  }
}

class PricesCard extends StatelessWidget {
  PricesCard({@required this.shop, @required this.price, @required this.link});

  final String shop;
  final String price;
 // final String isbn;
  final String link;

  @override
  Widget build(BuildContext context) {
    return
      Card(
        color: logIn, //Colors.lightBlueAccent,
        elevation: 5.0,
        margin: EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
    ),
    child:
    Padding(
        padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
        child: GestureDetector(
          onTap: () {
            Shop(link).launchPage();
          },
        child:
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children : [
              Text(
                '$shop',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,//blueGrey,
                ),
              ),
              Text(
                '£$price',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,//blueGrey,
                ),
              ),
            ]),
        ),
      ),
      );
  }
}

class TasksList extends StatelessWidget {

  TasksList(this.cc);

  final List <PricesCard> cc;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return PricesCard(shop: cc[index].shop, price: cc[index].price, link: cc[index].link);
    },
      itemCount: cc.length,
    );
  }
}
