import 'package:fast_rsa/fast_rsa.dart';

class EncryptionRSA {
  String publicKey = '';
  String privateKey = '';

  Future<void> generateKeyPair() async {
    try {
      var keyPair = await RSA.generate(2048);

      publicKey = keyPair.publicKey;
      privateKey = keyPair.privateKey;
    } catch (e) {
      print('Error generating key pair: $e');
    }
  }

  Future<String?> encryptRSA(String message) async {
    try {
      String encrypted = await RSA.encryptPKCS1v15(message, publicKey);
      return encrypted;
    } catch (e) {
      print('Error encrypting message: $e');
      return null;
    }
  }

  Future<String?> decryptRSA(String encrypted) async {
    try {
      String decrypted =
          await RSA.decryptPKCS1v15(encrypted, privateKey);
      return decrypted;
    } catch (e) {
      print('Error decrypting message: $e');
      return null;
    }
  }
}
