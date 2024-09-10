import 'package:encrypt/encrypt.dart';

class EncryptionAES {
  final key = Key.fromLength(32);
  final iv = IV.fromLength(16);

  Encrypted? encrypt(String plainText) {
    final encrypter = Encrypter(AES(key));
    if (plainText.isNotEmpty) {
      final encrypted = encrypter.encrypt(plainText, iv: iv);
      return encrypted;
    } else {
      return null;
    }
  }

  String? decrypt(Encrypted? encryptedText) {
    final encrypter = Encrypter(AES(key));
    if (encryptedText != null) {
      final decrypted = encrypter.decrypt(encryptedText, iv: iv);
      return decrypted;
    } else {
      return null;
    }
  }
}
