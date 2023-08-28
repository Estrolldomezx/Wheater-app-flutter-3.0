import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  late String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        padding: EdgeInsets.only(left: 32, right: 32),
        child: Column(
          children: <Widget>[
            TextField(
              style: TextStyle(
                color: Colors.black,
              ),
              decoration: textFieldInputDecoration,
              onChanged: (value) {
                cityName = value;
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              height: 50.0,
              width: double.infinity,
              child:
                  // FlatButton(
                  //   color: Color(0xFFFCA311),
                  //   shape: new RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  //   onPressed: () {
                  //     Navigator.pop(context, cityName);
                  //   },
                  //   child: Text(
                  //     'Search',
                  //     style: buttonTextStyle,
                  //   ),
                  // ),
                  TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: null,
                child: const Text('Disabled'),
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: IconButton(
        highlightColor: Colors.transparent,
        splashRadius: 27.5,
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
