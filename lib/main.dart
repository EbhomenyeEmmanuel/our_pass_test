import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:our_pass_test/injector.dart';
import 'package:our_pass_test/provider/SignUpProvider.dart';
import 'package:our_pass_test/provider/login_provider.dart';
import 'package:our_pass_test/ui/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SignUpProvider>(
          create: (context) => locator(),
        ),
        ChangeNotifierProvider<LoginProvider>(
          create: (context) => locator(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
