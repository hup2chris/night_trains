import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
  'XRP',
  'MIOTA',
  'TRX',
  'ADA',
  'ZEC',
  'NEO',
  'DASH',
  'ETC',
  'XTZ',
  'EOS',
  'XLM',
  'BCH',
];

/*final _firestore = FirebaseFirestore.instance;
User loggedInUser;*/
double currPrice;

/*final _auth = FirebaseAuth.instance;
final user = _auth.currentUser;*/

Map<String, int> arrow = {};

/*Map<String, int> getArrow() {
  return arrow;
}*/

class BooksData {

 /* String getCurrentUser()  {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        //print(loggedInUser.email);
      }
    }
    catch (e) {
      print(e);
    }
    return loggedInUser.email;
  }*/

  Future getBookData(String title, String author, String isbn) async {

    //Map<String, String> prices = {'Chris':'1775',};
    //Map<String, String, String, String> books = {'Chris':'1775',};
    var decodedData;
    String requestURL;// = ccAllAPIURL;
    String file, spisbn, dtitle, dauthor, img;
    int arrlength = 0;

    for (int i = 0; i < cryptoList.length; i++) {
      requestURL = '$requestURL${cryptoList[i]},';
    }

    if (isbn.length > 1) {
      file = "https://www.googleapis.com/books/v1/volumes?q=isbn:" +
          isbn.replaceAll(" ", "+");
    }

    else if (title.length > 1 && author.length > 1) {
      file = 'https://www.googleapis.com/books/v1/volumes?q=intitle:"' +
          title.replaceAll(" ", "+") + '"+inauthor:"' +
          author.replaceAll(" ", "+") +
          '"&filter=ebooks&hl=en&startIndex=0&maxResults=40';
    }
    else if (title.length > 1) {

      file = 'https://www.googleapis.com/books/v1/volumes?q=intitle:' + title.replaceAll(" ", "+") + '&filter=ebooks&hl=en&startIndex=0&maxResults=40';

    }

    else if (author.length > 1) {
      file = 'https://www.googleapis.com/books/v1/volumes?q=inauthor:"' +
          author.replaceAll(" ", "+") +
          '"&filter=ebooks&hl=en&startIndex=0&maxResults=40';
    }

   //requestURL = '$requestURL&tsyms=$selectedCurrency&apikey=$apiKey';
    requestURL = file;
   // String now = DateFormat("yyyy-MM-dd").format(DateTime.now());
   //  print(requestURL);
    http.Response response = await http.get(Uri.parse(requestURL));
    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);

      arrlength = 'saleability'.allMatches(decodedData.toString()).length;
          //substr_count(decodedData, 'saleability');

    //  print('arrlength is $arrlength');

      for(int x = 0; x < arrlength; x++) {

        //$data['items'][$x]['saleInfo']['country'] == 'GB' &&

       if ( decodedData['items'][x]['saleInfo']['saleability'] == 'FOR_SALE') {

        // print ("got here $arrlength");

          spisbn = decodedData['items'][x]['volumeInfo']['industryIdentifiers'][0]['identifier'];

          dtitle = decodedData['items'][x]['volumeInfo']['title'];

          dauthor =  '${decodedData['items'][x]['volumeInfo']['authors'].join("," + " ")}';

          img = decodedData['items'][x]['volumeInfo']['imageLinks']['smallThumbnail'].replaceAll("http", "https");

       //   print(decodedData['items'][x]['saleInfo']['listPrice']['amount']);

  //  echo "<div id='expisbn' style='display: none;'>" . $spisbn . "</div>";

 //  echo "<td><a href='?sisbn=$spisbn&title=$title&author=$authors&isbn=$isbn' onClick=\"document.getElementById('ana').display = 'block';\">Prices</a></td></tr>";


    }

     //   print('$spisbn, $dtitle, $dauthor, $img');

    }


   /* if (arrlength < 1) {
    echo "<h5><b style='color:orange'>Sorry, no books matching your criteria could be found!!</b></h5>";
    }*/
    //  print(decodedData);
        /*var lastPrice = decodedData['${cryptoList[i]}']['$title']
            .toString();
        prices[cryptoList[i]] = lastPrice;
        currPrice = decodedData['${cryptoList[i]}']['$title'];*/

/*

        try {
          // print('user is $user');
         /* if (user != null) {
            //print(now);

            int ins = 1;

            final messages = await _firestore.collection('crypto_data').where(
                'date', isEqualTo: now).
            where('crypto', isEqualTo: cryptoList[i]).
            where('currency', isEqualTo: selectedCurrency).get();
            for (var message in messages.docs) {
              //  print('match below');
              //  print(message.data());
              ins = 0;
            }

            if (ins == 1) {
              _firestore.collection('crypto_data').add({
                'crypto': cryptoList[i],
                'currency': selectedCurrency,
                'price': lastPrice,
                'date': now,
                'sender': user.email,
                'timestamp': Timestamp.now(),
              });
              print('added $now ${cryptoList[i]} $selectedCurrency');
            }
          }*/

          int days = 0;
          int stop = 0;
          int weeks = 0;
          int wstop = 0;

       /*   final arrows = await _firestore.collection('crypto_data').
          where('date', isNotEqualTo: now).
          where('crypto', isEqualTo: cryptoList[i]).
          where('currency', isEqualTo: selectedCurrency).
          orderBy('date', descending: true).get();
          for (var arrow in arrows.docs) {
            //  print('match below');
            //  print(arrow.data());
            // var decodedData = jsonDecode(arrow.data().toString());
            //print(decodedData);
            // print(arrow["price"]);
            if (days >= 0) {
              if (double.parse(arrow["price"]) < currPrice && stop == 0) {
                days++;
                currPrice = double.parse(arrow["price"]);
              }
              else if (days > 0)
                stop = 1;
            }

            if (days <= 0) {
              if (double.parse(arrow["price"]) > currPrice && stop == 0) {
                days--;
                currPrice = double.parse(arrow["price"]);
              }
              else if (days < 0)
                stop = 1;
            }
          }*/

         // arrow[cryptoList[i]] = days;
          //print('cd days are 197575');
        }
        catch (e) {
          print(e);
         // print('error with $now ${cryptoList[i]} $selectedCurrency');
        }*/
    } else {
      print('There is a problem ${response.statusCode}');
      throw 'Problem with the get request';
    }
    //return prices;
    return decodedData;
  }

  Future getHiveData(String isbn) async {

    var decodedData;
    String requestURL;// = ccAllAPIURL;
    String file;//, spisbn, dtitle, dauthor, img;
   // int arrlength = 0;

    if (isbn.length > 1) {
      file = "https://www.hive.co.uk/Search/Keyword?keyword=" +
          isbn.replaceAll(" ", "+");
    }

    print(file);

    requestURL = file;

  //  print(requestURL);
    http.Response response = await http.get(Uri.parse(requestURL),
      headers: {
        "Access-Control-Allow-Origin": "*", // Required for CORS support to work
        "Access-Control-Allow-Credentials": "true", // Required for cookies, authorization headers with HTTPS
        "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
        "Access-Control-Allow-Methods": "GET, HEAD, POST, OPTIONS"
      },);

    if (response.statusCode == 200) {
      decodedData = response.body;

      print(decodedData.toString().indexOf('t find any results for'));

      print(decodedData.toString().substring(decodedData.toString().indexOf('itemprop="price" content="')+26,
          decodedData.toString().indexOf('itemprop="price" content="')+26 + decodedData.toString().substring(
        decodedData.toString().indexOf('itemprop="price" content="')+26).indexOf(">")-1)
           );


      if (decodedData.toString().indexOf('Object moved to') > 1) {
        file =  "https://www.hive.co.uk/" +
            decodedData.toString().substring(decodedData.toString().indexOf('Product'),decodedData.toString().substring(decodedData.toString().indexOf('Product')).indexOf('>')-1);

        print(file);
        requestURL = file;

        //  print(requestURL);
        http.Response response = await http.get(Uri.parse(requestURL));
        if (response.statusCode == 200) {
          decodedData = response.body;

        } else {
          print('There is a problem ${response.statusCode}');
          throw 'Problem with the get request';
        }

      }
    //    print('$spisbn, $dtitle, $dauthor, $img');
    } else {
      print('There is a problem ${response.statusCode}');
      throw 'Problem with the get request';
    }
    return decodedData;
  }

  Future getKoboData(String isbn) async {

    var decodedData;
    String requestURL;// = ccAllAPIURL;
    String file;

    if (isbn.length > 1) {
      file = 'https://www.kobo.com/gb/en/search?hreflang=en-gb&query=' +
          isbn.replaceAll(" ", "+");

      file = 'https://hup2.com/ebpc/prices_json.php?sisbn=' +
          isbn.replaceAll(" ", "+");

    //  file = "https://www.googleapis.com/books/v1/volumes?q=isbn:" +
      //    isbn.replaceAll(" ", "+");
    }

    print(file);

    requestURL = file;

    //  print(requestURL);
    http.Response response = await http.get(Uri.parse(requestURL),);

  //  var dio = Dio();
   // final //response = await dio.get(file);
// This works well.
  //  response = await dio.get(file);

    // This works well too.
    //response = await dio.get<String>(file);

    // This is the recommended way.
  //  var r = await dio.get<String>(file);
   // print(r.data?.length);
     //print(response.data);
    if (response.statusCode == 200) {
      decodedData = response.body;
      decodedData = jsonDecode(response.body);

      //decodedData = parser.parse(response.body);

      //print(document);

    /*  print(decodedData.toString().indexOf('t find any results for'));

      print(decodedData.substring(decodedData.indexOf('og:price')+19,
          decodedData.indexOf('og:price')+19 +
        decodedData.substring(decodedData.indexOf('og:price')+19).indexOf(">")-2
         )
      );
*/

     /* if (decodedData.toString().indexOf('Object moved to') > 1) {
        file =  "https://www.kobo.com/" +
            decodedData.toString().substring(decodedData.toString().indexOf('/gb'),decodedData.toString().substring(decodedData.toString().indexOf('/gb')).indexOf('>')-1);

        print(file);
        requestURL = file;

        //  print(requestURL);
      /*  http.Response response = await http.get(Uri.parse(requestURL));
        if (response.statusCode == 200) {
          decodedData = response.body;

        } else {
          print('There is a problem ${response.statusCode}');
          throw 'Problem with the get request';
        }*/

      }
      //    print('$spisbn, $dtitle, $dauthor, $img');*/
    } else {
      print('There is a problem ${response.statusCode}');
      throw 'Problem with the get request';
    }
   /* final response =
    await http.Client().get(Uri.parse('https://www.geeksforgeeks.org/'));
    //Status Code 200 means response has been received successfully
    if (response.statusCode == 200) {
      //Getting the html document from the response
      decodedData = parser.parse(response.body);
    }*/

    return decodedData;
  }

}
