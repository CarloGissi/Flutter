import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'MyNevBar.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: FutureBuilder(
        future: _fbApp,
        builder: (context, snapshot){
          if(snapshot.hasError) {
            print('error ${snapshot.error.toString()}');
            return Text('erroreeee');
          }
          else if(snapshot.hasData) {
            return MyNevBar();
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      )
      //MyNevBar(),
    );
  }
}



