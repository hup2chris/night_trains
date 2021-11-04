import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 70.0,
);

const kTempLandTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 30.0,
);

const kHourlyTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 30.0,
);

const kHourlyTempLandTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 20.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 40.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kButtonTextStyle2 = TextStyle(
  fontSize: 30.0,
  fontFamily: 'SourceSansPro-Bold',
  color: Color(0xFF004D40),
);

const kListTileTextStyle = TextStyle(
color: Color(0xFF004D40),
fontFamily: 'SourceSansPro-Bold',
fontSize: 20.0,
);

const kListTileTFTextStyle = TextStyle(
  fontFamily: 'SourceSansPro-Bold',
  fontSize: 20.0,
);

const kSearchTextStyle = TextStyle(
  fontFamily: 'SourceSansPro-Bold',
  fontSize: 20.0,
  color: Color(0xFF004D40),
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kConditionLandTextStyle = TextStyle(
  fontSize: 50.0,
);

const kHourlyConditionTextStyle = TextStyle(
  fontSize: 30.0,
);

const kHourlyConditionLandTextStyle = TextStyle(
  fontSize: 20.0,
);

const kTextFieldInputDecoration = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    icon: Icon(
      Icons.location_city,
      color: Colors.white,
    ),
    hintText: 'Enter City Name',
    hintStyle: TextStyle(
      color: Colors.grey,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
      borderSide: BorderSide.none,
    )
);
