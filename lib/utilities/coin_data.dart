import 'dart:convert';
import 'package:http/http.dart' as http;
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:intl/intl.dart';

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

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const ccAPIURL = 'https://min-api.cryptocompare.com/data/price?fsym=';
const ccAllAPIURL = 'https://min-api.cryptocompare.com/data/pricemulti?fsyms=';//BTC,ETH&tsyms=USD,EUR';
const apiKey = 'd59be42812ac859920cb6cead7d49f5a216718617954e197a723a49a1bb1c1fb';

/*final _firestore = FirebaseFirestore.instance;
User loggedInUser;*/
double currPrice;

/*final _auth = FirebaseAuth.instance;
final user = _auth.currentUser;*/

Map<String, int> arrow = {};

/*Map<String, int> getArrow() {
  return arrow;
}*/

class CoinData {

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

  Future getCoinData(String selectedCurrency) async {

    Map<String, String> prices = {'Chris':'1775',};
    String requestURL = ccAllAPIURL;

    for (int i = 0; i < cryptoList.length; i++) {
      requestURL = '$requestURL${cryptoList[i]},';
    }

    requestURL = '$requestURL&tsyms=$selectedCurrency&apikey=$apiKey';
   // String now = DateFormat("yyyy-MM-dd").format(DateTime.now());
    // print(requestURL);
    http.Response response = await http.get(Uri.parse(requestURL));
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      //print(decodedData);
      for (int i = 0; i < cryptoList.length; i++) {
        //print('cd days are 197575');
        var lastPrice = decodedData['${cryptoList[i]}']['$selectedCurrency']
            .toString();
        prices[cryptoList[i]] = lastPrice;
        currPrice = decodedData['${cryptoList[i]}']['$selectedCurrency'];

      /*  try {
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
         // int stop = 0;
         // int weeks = 0;
        //  int wstop = 0;

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

          arrow[cryptoList[i]] = days;
          //print('cd days are 197575');
        }
        catch (e) {
          print(e);
         // print('error with $now ${cryptoList[i]} $selectedCurrency');
        }*/
      }
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
    return prices;
  }
}
