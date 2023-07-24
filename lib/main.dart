import 'package:flutter/material.dart';
import 'package:learning_flutter/alrajhi_home.dart';
import 'package:learning_flutter/ippb/ippb_login.dart';

void main() {
  runApp(const MyApp());
}
// Widget is used to create UI in flutter framework.

/* StatelessWidget is a widget, which does not maintain
any state of the widget. */

/* MyApp extends StatelessWidget and overrides its
build method. */
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title of the application
      title: 'Hello World Demo Application',
      // theme of the widget
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      // Inner UI of the application
      home: const MyHomePage(title: 'Home page'),
    );
  }
}

/* This class is similar to MyApp instead it
returns Scaffold Widget */
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        // Sets the content to the
        // center of the application page
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
              const SizedBox(
                height: 100,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SimpleLoginScreen(key: key)));
                  },
                  child: const Text('IPPB')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            const AlrajhiHome(title: 'Alrajhi')));
                  },
                  child: const Text('Alrajhi PG')),
              const SizedBox(
                height: 100,
              ),
            ])));
  }
}
