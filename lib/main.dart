import 'package:flutter/material.dart';
import 'package:flutter_starter/pages/home_page.dart';
import 'package:flutter_starter/remote/providers/auth_provider.dart';
import 'package:flutter_starter/remote/providers/example_provider.dart';
import 'package:provider/provider.dart';
import 'remote/di/di_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => di.sl<AuthProvider>()),
    ChangeNotifierProvider(create: (context) => di.sl<ExampleProvider>()),
  ], child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(title: 'Hello World'),
    );
  }
}
