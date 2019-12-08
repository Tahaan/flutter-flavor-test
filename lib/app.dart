import 'dart:async';

import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.color}) : super(key: key);


  final Color color;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  ConnectivityResult currentStatus;
  StreamSubscription<ConnectivityResult> connectivitySubs;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _newConnectivityState(ConnectivityResult result) {
    currentStatus = result;
    if (mounted) setState(() {

    });
  }
  @override
  void initState() {
    super.initState();

    connectivitySubs = Connectivity().onConnectivityChanged.listen(_newConnectivityState);

    Connectivity().checkConnectivity().then(_newConnectivityState);


  }

  @override
  void dispose() {
    // TODO: implement dispose
    if (connectivitySubs != null)
      connectivitySubs.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Hello World'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(40),
              child: Icon(currentStatus == ConnectivityResult.wifi ? Icons.network_wifi :
              currentStatus == ConnectivityResult.mobile ? Icons.network_cell : Icons.signal_wifi_off,
              color: widget.color,),
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
