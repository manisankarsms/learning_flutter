import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:learning_flutter/aes_enc_dec.dart';

class WebService {
  //final String baseUrl;

  //WebService(this.baseUrl);

  Future<Map<String, dynamic>> call(String endpoint, String requestBody) async {
    final String apiUrl = endpoint;

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: AESEncryptionDecryption(Random().nextInt(16).toString(), "SAMPLEENCRYPTION").aesEncrypt(requestBody),
      );

      if (response.statusCode == 200) {
        // If the API call is successful (status code 200), parse the JSON response
        final Map<String, dynamic> data = json.decode(response.body);
        return {'success': true, 'data': data};
      } else {
        // If the API call fails, return the error response
        return {'success': false, 'errorMessage': 'API call failed with status code ${response.statusCode}'};
      }
    } catch (e) {
      // Handle any exceptions that occur during the API call
      return {'success': false, 'errorMessage': 'Error occurred: $e'};
    }
  }
}
