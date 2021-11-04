import 'package:url_launcher/url_launcher.dart';

class Hup2 {

  launchPage () async {
    const url = 'https://hup2.com';

    try {
      await launch(url);
    }
    catch (e) {
      print(e);
    }
  }

}

class FLT {

  launchPage () async {
    const url = 'https://hup2.com/pl';

    try {
      await launch(url);
    }
    catch (e) {
      print(e);
    }
  }

}

class HRT {

  launchPage () async {
    const url = 'https://hup2.com/hr';

    try {
      await launch(url);
    }
    catch (e) {
      print(e);
    }
  }

}

class Shop  {

  final String surl;

  Shop(this.surl);

  launchPage () async {
    String url = surl;

    try {
      await launch(surl);
    }
    catch (e) {
      print(e);
    }
  }

}