import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_signup_system/models/user.dart';
import 'package:login_signup_system/screens/wrapper_page.dart';
import 'package:login_signup_system/services/auth.dart';
import 'services/firebase_options.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
    // options: DefaultFirebaseOptions.currentPlatform,
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      name: 'loginsystem',
      options: DefaultFirebaseOptions.currentPlatform,
    ).whenComplete(() {
      print("completedAppInitialize");
    });

  }
  // );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyAppPage(),
    );
  }
}


class MyAppPage extends StatelessWidget {


  final AuthService _auth = AuthService();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User_Fire?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
      home:  Wrapper(),
      ),
    );
  }
}
