import 'dart:convert';
import 'package:encrypt/encrypt.dart';

class AESEncryptionDecryption {
  final String _key;
  final String _iv;

  AESEncryptionDecryption(this._key, this._iv);

  String aesEncrypt(String plainText) {
    final key = Key.fromUtf8(_key);
    final iv = IV.fromUtf8(_iv);
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));

    final encrypted = encrypter.encrypt(plainText, iv: iv);
    return base64Encode(encrypted.bytes);
  }

  String aesDecrypt(String encryptedText) {
    final key = Key.fromUtf8(_key);
    final iv = IV.fromUtf8(_iv);
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));

    final encryptedBytes = base64Decode(encryptedText);
    final decrypted = encrypter.decryptBytes(Encrypted(encryptedBytes), iv: iv);
    return utf8.decode(decrypted);
  }
}
