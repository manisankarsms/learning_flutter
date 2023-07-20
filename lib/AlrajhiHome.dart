import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlrajhiHome extends StatelessWidget {
  const AlrajhiHome({Key? key, required this.title}) : super(key: key);
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
          child: ElevatedButton(
              onPressed: () {
              },
              child: const Text('BinCheck API')),
        ));
  }
}
