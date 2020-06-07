# Fzwallpaper

Fzwallpaper is a plugin to apply a wallpaper in android. And its only available for Android.

## Installation

In the `dependencies:` section of your `pubspec.yaml`, add the following line:

```yaml
fzwallpaper: <latest_version>
```

### Example

```dart
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
```

## 💰 Donations

This project needs you! If you would like to support this project's further upgradations, the creator of this project or the continuous maintenance of this project, feel free to donate. Your donation is highly appreciated (and I love food, coffee and beer). Thank you!

**Paypal**

**For All Developers**

* **[Donate $5](https://www.paypal.me/frazile/USD5)**: Thank's for creating this project, here's a coffee or juice or beer for you!
* **[Donate $10](https://www.paypal.me/frazile/USD10)**: Wow, I am stunned. Let me take you to the movies.
* **[Donate $15](https://www.paypal.me/frazile/USD15)**: I really appreciate your work, let's grab some lunch!
* **[Donate $20](https://www.paypal.me/frazile/USD20)**: That's some awesome stuff you did right there, Pizza/Burger is on me!
* **[Donate $25](https://www.paypal.me/frazile/USD25)**: Thank's for the code, get a Firebase Flame Plan for your next project.
* **[Donate $30](https://www.paypal.me/frazile/USD30)**: I really really want to support this project, great job!
* **[Donate $35](https://www.paypal.me/frazile/USD35)**: You are the man! This project saved me hours (if not days) of struggle and hard work, simply awesome!
* **[Donate $40](https://www.paypal.me/frazile/USD40)**: I want to learn more let's connect, Dinner is on me!
* **[Donate $45](https://www.paypal.me/frazile/USD45)**: Many many thanks for the flutter project in dart language.
* **[Donate $50](https://www.paypal.me/frazile/USD50)**: Thanks to tell the working of Firebase Cloud Functions in JavaScript/TypeScript & using of Nodejs & Firebase CLI!
* **[Donate $60](https://www.paypal.me/frazile/USD60)**: Let me buy u some Storage Server, about say 100 GB!
* **[Donate $70](https://www.paypal.me/frazile/USD70)**: Thank's for creating this plugin/package/code, here's some bugs for Domain Name with SSL, Storage Server(150 GB)!
* **[Donate $80](https://www.paypal.me/frazile/USD80)**: Thank's for creating this plugin/package/code, here's some bugs for Domain Name with SSL, Storage Server(150 GB), Lights billings!
* **[Donate $90](https://www.paypal.me/frazile/USD90)**: Thank's for creating this plugin/package/code, here's some bugs for Domain Name with SSL, Storage Server(150 GB), Lights & Internet billings!
* **[Donate $100](https://www.paypal.me/frazile/USD100)**: Thank's for creating the best plugin/package/code, here's a 2TB HDD for your Storage Server is on me!
* **[Donate $299](https://www.paypal.me/frazile/USD299)**: Thank's buddy for the awesome plugin/package/app/game developed, buy Apple TV 4K for yourself!
* **[Donate $799](https://www.paypal.me/frazile/USD799)**: Thank's buddy for the awesome plugin/package/app/game developed, buy Apple Watch for yourself!
* **[Donate $1500](https://www.paypal.me/frazile/USD1500)**: Thank's buddy for the awesome plugin/package/app/game developed, buy Apple iPhone for yourself!
* **[Donate $2000](https://www.paypal.me/frazile/USD2000)**: Thank's buddy for the awesome plugin/package/app/game developed, buy Apple iPad for yourself!
* **[Donate $2500](https://www.paypal.me/frazile/USD2500)**: Thank's buddy for the awesome plugin/package/app/game developed, buy Apple Mac Mini & Storage Server for yourself!
* **[Donate $3000](https://www.paypal.me/frazile/USD3000)**: Thank's buddy for the awesome plugin/package/app/game developed, buy Apple MacBook Pro for yourself!
* **[Donate $7000](https://www.paypal.me/frazile/USD7000)**: Thank's buddy for the awesome plugin/package/app/game developed, buy Apple iMac Pro 5K for yourself!

**For UK Developers**

* **[Donate £5](https://www.paypal.me/frazile/GBP5)**: Thank's for creating this project, here's a coffee or juice or beer for you!
* **[Donate £10](https://www.paypal.me/frazile/GBP10)**: Wow, I am stunned. Let me take you to the movies.
* **[Donate £15](https://www.paypal.me/frazile/GBP15)**: I really appreciate your work, let's grab some lunch!
* **[Donate £20](https://www.paypal.me/frazile/GBP20)**: That's some awesome stuff you did right there, Pizza/Burger is on me!
* **[Donate £25](https://www.paypal.me/frazile/GBP25)**: Thank's for the code, get a Firebase Flame Plan for your next project.
* **[Donate £30](https://www.paypal.me/frazile/GBP30)**: I really really want to support this project, great job!
* **[Donate £35](https://www.paypal.me/frazile/GBP35)**: You are the man! This project saved me hours (if not days) of struggle and hard work, simply awesome!
* **[Donate £40](https://www.paypal.me/frazile/GBP40)**: I want to learn more let's connect, Dinner is on me!
* **[Donate £45](https://www.paypal.me/frazile/GBP45)**: Many many thanks for the flutter project in dart language.
* **[Donate £50](https://www.paypal.me/frazile/GBP50)**: Thanks to tell the working of Firebase Cloud Functions in JavaScript/TypeScript & using of Nodejs & Firebase CLI!
* **[Donate £60](https://www.paypal.me/frazile/GBP60)**: Let me buy u some Storage Server, about say 100 GB!
* **[Donate £70](https://www.paypal.me/frazile/GBP70)**: Thank's for creating this plugin/package/code, here's some bugs for Domain Name with SSL, Storage Server(150 GB)!
* **[Donate £80](https://www.paypal.me/frazile/GBP80)**: Thank's for creating this plugin/package/code, here's some bugs for Domain Name with SSL, Storage Server(150 GB), Lights billings!
* **[Donate £90](https://www.paypal.me/frazile/GBP90)**: Thank's for creating this plugin/package/code, here's some bugs for Domain Name with SSL, Storage Server(150 GB), Lights & Internet billings!
* **[Donate £100](https://www.paypal.me/frazile/GBP100)**: Thank's for creating the best plugin/package/code, here's a 2TB HDD for your Storage Server is on me!
* **[Donate £299](https://www.paypal.me/frazile/GBP299)**: Thank's buddy for the awesome plugin/package/app/game developed, buy Apple TV 4K for yourself!
* **[Donate £799](https://www.paypal.me/frazile/GBP799)**: Thank's buddy for the awesome plugin/package/app/game developed, buy Apple Watch for yourself!
* **[Donate £1500](https://www.paypal.me/frazile/GBP1500)**: Thank's buddy for the awesome plugin/package/app/game developed, buy Apple iPhone for yourself!
* **[Donate £2000](https://www.paypal.me/frazile/GBP2000)**: Thank's buddy for the awesome plugin/package/app/game developed, buy Apple iPad for yourself!
* **[Donate £2500](https://www.paypal.me/frazile/GBP2500)**: Thank's buddy for the awesome plugin/package/app/game developed, buy Apple Mac Mini & Storage Server for yourself!
* **[Donate £3000](https://www.paypal.me/frazile/GBP3000)**: Thank's buddy for the awesome plugin/package/app/game developed, buy Apple MacBook Pro for yourself!
* **[Donate £7000](https://www.paypal.me/frazile/GBP7000)**: Thank's buddy for the awesome plugin/package/app/game developed, buy Apple iMac Pro 5K for yourself!

Of course, you can also choose what you want to donate, all donations are awesome!

## Developed By

```
Parth Aggarwal CEO & Developer of Frazile Inc.
```