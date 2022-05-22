import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'HomeList.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCPDEQ2i_IYCLQ-UMdclQRm6QJwuFboFLg",
      authDomain: "flutter-7da50.firebaseapp.com",
      projectId: "flutter-7da50",
      storageBucket: "flutter-7da50.appspot.com",
      messagingSenderId: "322746282249",
      appId: "1:322746282249:web:20c91ddd403bb4706723d8",
      measurementId: "G-BQ4RYBJB51"
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeList());
  }
}
