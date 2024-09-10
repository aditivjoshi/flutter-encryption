import 'package:encrypt/encrypt.dart';
import 'package:flutter/material.dart';
import 'package:testapp/encryption_aes.dart';

class AesScreen extends StatefulWidget {
  const AesScreen({super.key});

  @override
  State<AesScreen> createState() => _AesScreenState();
}

class _AesScreenState extends State<AesScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  Encrypted? encrypted;
  String? decrypted;
  final EncryptionAES _encryptionAES = EncryptionAES();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('AES',
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 24,
              )),
          const Text('(symmetric)',
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 14,
              )),
          const SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              textAlign: TextAlign.center,
              controller: _textEditingController,
              decoration: InputDecoration(
                labelStyle: const TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16,
                ),
                hintText: 'Plain Text',
                hintStyle: const TextStyle(
                  color: Colors.grey,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blueGrey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                decrypted = null;
                encrypted = _encryptionAES.encrypt(_textEditingController.text);
                setState(() {});
              },
              child: const Text('encrypt')),
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(
              child: Text(
                encrypted?.base64 ?? '------',
                style: const TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                decrypted = _encryptionAES.decrypt(encrypted);
                setState(() {});
              },
              child: const Text('decrypt')),
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(
              child: Text(
                decrypted ?? '------',
                style: const TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
