import 'package:flutter/material.dart';
import 'package:testapp/screen_aes.dart';
import 'package:testapp/screen_rsa.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: HomeScreen()),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Encryption Algorithms'),
          bottom: const TabBar(
            tabs: [
              Tab(text: "AES"),
              Tab(text: "RSA"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [AesScreen(), RsaScreen()],
        ),
      ),
    );
  }
}
