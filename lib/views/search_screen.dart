import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Search Screen'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: const Center(child: Text(' '),),
    );
  }
}
