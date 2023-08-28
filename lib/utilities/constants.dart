import 'package:flutter/material.dart';

const kBackgroundColor = Color(0xFF121212);
const kPrimaryColor = Color(0xFFFFBD73);

const cityNameTextStyle = TextStyle(
  fontFamily: 'OpenSans',
  fontWeight: FontWeight.bold,
  fontSize: 48.0,
  color: Colors.white,
);

const timeTextStyle = TextStyle(
  fontFamily: 'OpenSans',
  fontSize: 32.0,
  color: Colors.white,
);

const timeTextSmallStyle = TextStyle(
  fontFamily: 'OpenSans',
  fontSize: 22.0,
  color: Colors.white,
);

const temperatureTextStyle = TextStyle(
  fontFamily: 'OpenSans',
  fontWeight: FontWeight.bold,
  fontSize: 80.0,
  color: Colors.white,
);

const conditionTextStyle = TextStyle(
  fontFamily: 'OpenSans',
  fontSize: 24.0,
  color: Colors.white,
);

const conditionTextPrimaryStyle = TextStyle(
  fontFamily: 'OpenSans',
  fontSize: 24.0,
  color: Color(0xFFFFBD73),
);

const smallTemperatureTextStyle = TextStyle(
  fontFamily: 'OpenSans',
  fontSize: 32.0,
  color: Color(0xFFE5E5E5),
);

const buttonTextStyle = TextStyle(
  fontFamily: 'OpenSans',
  fontSize: 32.0,
  color: Colors.white,
);

const textFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  prefixIcon: Icon(
    Icons.place,
    color: Colors.grey,
  ),
  hintText: 'City Name',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);