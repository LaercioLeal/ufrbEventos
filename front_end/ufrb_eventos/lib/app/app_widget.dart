import 'package:asuka/asuka.dart' as asuka;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        // Initialize FlutterFire:
        future: _initialization,
        builder: (context, snapshot) {
          // Check for errors
          if (snapshot.hasError) {
            return Container();
          }

          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              navigatorKey: Modular.navigatorKey,
              title: 'Flutter Slidy',
              theme: ThemeData(
                primarySwatch: Colors.grey,
                accentColor: Colors.greenAccent,
                snackBarTheme: SnackBarThemeData(backgroundColor: Colors.green[400])
              ),
              initialRoute: '/',
              onGenerateRoute: Modular.generateRoute,
              builder: asuka.builder,
            );
          }

          // Otherwise, show something whilst waiting for initialization to complete
          return CircularProgressIndicator();
        });
  }
}
