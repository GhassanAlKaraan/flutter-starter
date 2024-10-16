import 'package:flutter/material.dart';
import 'package:flutter_starter/pages/home_page.dart';
import 'package:flutter_starter/remote/providers/auth_provider.dart';
import 'package:flutter_starter/remote/providers/example_provider.dart';
import 'package:flutter_starter/themes/light_theme.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StarterApp',
      theme: lightTheme,
      home: const MyHomePage(title: 'Hello World'),
    );
  }
}

// ?Use Analytics?
// void main() async {
//   await runZonedGuarded(
//     () async {
//       final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
//       // Retain native splash screen until Dart is ready
//       FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
//       await Firebase.initializeApp(
//         options: DefaultFirebaseOptions.currentPlatform,
//       );
//       GetIt.instance.registerLazySingleton(
//         () => HttpClient(baseOptions: BaseOptions(baseUrl: Env.serverUrl)),
//       );
//       if (!kIsWeb) {
//         if (kDebugMode) {
//           await FirebaseCrashlytics.instance
//               .setCrashlyticsCollectionEnabled(false);
//         } else {
//           await FirebaseCrashlytics.instance
//               .setCrashlyticsCollectionEnabled(true);
//         }
//       }
//       if (kDebugMode) {
//         await FirebasePerformance.instance
//             .setPerformanceCollectionEnabled(false);
//       }
//       FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
//       ErrorWidget.builder = (FlutterErrorDetails error) {
//         Zone.current.handleUncaughtError(error.exception, error.stack!);
//         return ErrorWidget(error.exception);
//       };
//       runApp(const MyApp());
//       FlutterNativeSplash.remove(); // Now remove splash screen
//     },
//     (exception, stackTrace) {
//       FirebaseCrashlytics.instance.recordError(exception, stackTrace);
//     },
//   );
// }
