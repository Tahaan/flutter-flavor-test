// To use this file create a new configuration and set the dart entrypoint
// to lib/main-alt.dart
// To reproduce the issue reported add a flavor setting and check that XCode
// has the Scheme set up for the flavor - a single Configuration named
// Debug-alt (where "alt" is the name you assign to the flavor) should be
// sufficient.  The XCode scheme needs to as a minimum define a distinct
// Build ID.


import 'package:flutter/material.dart';

import 'app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(color: Colors.red),
    );
  }
}
