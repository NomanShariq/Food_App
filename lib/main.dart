// @dart=2.9

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myfood_app/provider/my_provider.dart';
import 'package:myfood_app/screens/aboutus.dart';
import 'package:myfood_app/screens/checkout.dart';
import 'package:myfood_app/screens/homepage.dart';
import 'package:myfood_app/screens/product_detail_screen.dart';
import 'package:myfood_app/screens/profile.dart';
import 'package:myfood_app/screens/skip_screen.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: SignUp(),
        // home: StreamBuilder(
        //   stream: FirebaseAuth.instance.authStateChanges(),
        //   builder: (context, snapshot) {
        //     if (snapshot.hasData) {
        //       return HomePage();
        //     } else {
        //       return const LoginPage();
        //     }
        //   },
        // ),
        home: HomePage(),
      ),
    );
  }
}
