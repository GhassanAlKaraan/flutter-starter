import 'package:flutter/material.dart';

class UndefinitedPage extends StatelessWidget {
  final String? name;
  const UndefinitedPage({super.key, this.name = ""});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Undefinited View")),
      body: Center(
        child: Text("Route for $name is not defined"),
      ),
    );
  }
}
