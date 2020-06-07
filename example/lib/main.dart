import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fzwallpaper/fzwallpaper.dart';

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String home = "Home Screen", lock = "Lock Screen", both = "Both Screen";
  Stream<String> progressString;
  String res;
  bool downloading = false;
List<String> images = [
    "https://images.unsplash.com/photo-1525943837837-af668e09139d?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjk4MjkzfQ",
    "https://images.unsplash.com/photo-1478465726282-ddb11650c80b?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjk4MjkzfQ",
    "https://images.unsplash.com/photo-1532635248-cdd3d399f56c?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjk4MjkzfQ"
  ];
  var result = "Waiting to set Fzwallpaper";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: EdgeInsets.only(top: 20),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Image.network(
                      images[0],
                      fit: BoxFit.fitWidth,
                    ),
                    Positioned(
                      left: 10,
                      bottom: 0,
                      child: RaisedButton(
                        onPressed: () {
                          progressString =
                              Fzwallpaper.imageDownloadProgress(images[0]);
                          progressString.listen((data) {
                            setState(() {
                              res = data;
                              downloading = true;
                            });
                            print("DataReceived: " + data);
                          }, onDone: () async {
                            home = await Fzwallpaper.homeScreen();
                            setState(() {
                              downloading = false;
                              home = home;
                            });
                            print("Task Done");
                          }, onError: (error) {
                            setState(() {
                              downloading = false;
                            });
                            print("Some Error");
                          });
                        },
                        textColor: Colors.white,
                        padding: const EdgeInsets.all(0.0),
                        child: Center(
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: <Color>[
                                  Color(0xFF0D47A1),
                                  Color(0xFF1976D2),
                                  Color(0xFF42A5F5),
                                ],
                              ),
                            ),
                            padding: const EdgeInsets.all(10.0),
                            child: Text(home, style: TextStyle(fontSize: 16)),
                          ),
                        ),
                      ),
                    ),
                    Dialog()
                  ],
                ),
                Stack(
                  children: <Widget>[
                    Image.network(
                      images[1],
                      fit: BoxFit.fitWidth,
                    ),
                    Positioned(
                      left: 10,
                      bottom: 0,
                      child: RaisedButton(
                        onPressed: () {
                          progressString =
                              Fzwallpaper.imageDownloadProgress(images[1]);
                          progressString.listen((data) {
                            setState(() {
                              res = data;
                              downloading = true;
                            });
                            print("DataReceived: " + data);
                          }, onDone: () async {
                            lock = await Fzwallpaper.lockScreen();
                            setState(() {
                              downloading = false;
                              lock = lock;
                            });
                            print("Task Done");
                          }, onError: (error) {
                            setState(() {
                              downloading = false;
                            });
                            print("Some Error");
                          });
                        },
                        textColor: Colors.white,
                        padding: const EdgeInsets.all(0.0),
                        child: Center(
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: <Color>[
                                  Color(0xFF0D47A1),
                                  Color(0xFF1976D2),
                                  Color(0xFF42A5F5),
                                ],
                              ),
                            ),
                            padding: const EdgeInsets.all(10.0),
                            child: Text(lock, style: TextStyle(fontSize: 14)),
                          ),
                        ),
                      ),
                    ),
                    Dialog()
                  ],
                ),
                Stack(
                  children: <Widget>[
                    Image.network(
                      images[2],
                      fit: BoxFit.fitWidth,
                    ),
                    Positioned(
                      left: 10,
                      bottom: 0,
                      child: RaisedButton(
                        onPressed: () {
                          progressString =
                              Fzwallpaper.imageDownloadProgress(images[2]);
                          progressString.listen((data) {
                            setState(() {
                              res = data;
                              downloading = true;
                            });
                            print("DataReceived: " + data);
                          }, onDone: () async {
                            both = await Fzwallpaper.bothScreen();
                            setState(() {
                              downloading = false;
                              both = both;
                            });
                            print("Task Done");
                          }, onError: (error) {
                            setState(() {
                              downloading = false;
                            });
                            print("Some Error");
                          });
                        },
                        textColor: Colors.white,
                        padding: const EdgeInsets.all(0.0),
                        child: Center(
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: <Color>[
                                  Color(0xFF0D47A1),
                                  Color(0xFF1976D2),
                                  Color(0xFF42A5F5),
                                ],
                              ),
                            ),
                            padding: const EdgeInsets.all(10.0),
                            child: Text(both, style: TextStyle(fontSize: 14)),
                          ),
                        ),
                      ),
                    ),
                    Dialog()
                  ],
                ),
              ],
            ),
          )),
    );
  }

  Widget Dialog() {
    return Positioned(
      top: 200,
      left: 70,
      child: downloading
          ? Container(
              height: 120.0,
              width: 200.0,
              child: Card(
                color: Colors.black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    SizedBox(height: 20.0),
                    Text(
                      "Downloading File : $res",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            )
          : Text(""),
    );
  }
}
