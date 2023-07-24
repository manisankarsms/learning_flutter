import 'package:flutter/material.dart';
import 'package:learning_flutter/ippb/api_request.dart';
import 'web_service/web_service.dart';

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
                makeApiCall(context);
              },
              child: const Text('BinCheck API')),
        ));
  }

  void makeApiCall(context) async {
    String endpoint = 'data'; // Replace with your API endpoint
    Map<String, dynamic> response = await WebService().call("https://pos.ippbonline.in:4443/PoSabilityEngine_UAT/router", await ApiRequest().frameLoginRequest(context));

    if (response['success']) {
      // API call was successful, handle the data
      print('API call successful. Data: ${response['data']}');
    } else {
      // API call failed, handle the error
      print('API call failed. Error: ${response['errorMessage']}');
    }
  }
}
