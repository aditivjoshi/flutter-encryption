import 'package:flutter/material.dart';
import 'encryption_rsa.dart';

class RsaScreen extends StatefulWidget {
  const RsaScreen({super.key});

  @override
  State<RsaScreen> createState() => _RsaScreenState();
}

class _RsaScreenState extends State<RsaScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  String? encrypted;
  String? decrypted;
  final EncryptionRSA _encryptionRSA = EncryptionRSA();

  @override
  void initState() {
    super.initState();
    generateKeys();
  }

  generateKeys() async {
    await _encryptionRSA.generateKeyPair();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('RSA',
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 24,
              )),
          const Text('(asymmetric)',
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
              onPressed: () async {
                encrypted = await _encryptionRSA
                    .encryptRSA(_textEditingController.text);
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
                encrypted ?? '------',
                style: const TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                decrypted = await _encryptionRSA.decryptRSA(encrypted ?? '');
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
