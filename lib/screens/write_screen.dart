import 'package:flutter/material.dart';

class WriteScreen extends StatelessWidget {
  const WriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('글쓰기')),
      body: const Center(child: Text('글쓰기 화면')),
    );
  }
}
