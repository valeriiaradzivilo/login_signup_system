import 'package:flutter/material.dart';
import 'package:login_signup_system/screens/sign_up_page.dart';
import 'package:login_signup_system/services/auth.dart';
import 'package:login_signup_system/widgets/under_text.dart';
import '../widgets/form_field.dart';
import '../widgets/small_break_line.dart';
import 'blank_page.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign in',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: const SignInPage(
        title: 'Sign in page',
      ),
    );
  }
}

class SignInPage extends StatefulWidget {
  const SignInPage({super.key, required this.title});

  final String title;

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

  var isButtonFocused = false;

  void _onEnterChangeColor(PointerEvent details) {
    setState(() {
      isButtonFocused = !isButtonFocused;
    });
  }

  String error_message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 147, 149, 211),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 147, 149, 211),
          elevation: 0.0,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Center(
                child: UnderText(
                  text: "Sign Up",
                  page: SignUpPage(),
                  icon: Icon(Icons.add),
                ),
              ),
            )
          ],
        ),
        body: Padding(
            padding: EdgeInsets.all(deviceHeight(context) / 100.0),
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width / 200),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Text(
                              "Sign in",
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width / 8,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            FormFieldWidget(
                                controller: emailController,
                                labelTextForm: "Email",
                            type:"email",),
                            const SmallBreakLine(
                              amount: 1,
                            ),
                            FormFieldWidget(
                                controller: passwordController,
                                labelTextForm: "Password",
                            type: "password",),
                            const SmallBreakLine(
                              amount: 1,
                            ),
                            Text(
                              error_message,
                              style: const TextStyle(color: Colors.red),
                              textAlign: TextAlign.center,
                            ),
                            const SmallBreakLine(
                              amount: 1,
                            ),
                            MouseRegion(
                              onEnter: _onEnterChangeColor,
                              onExit: _onEnterChangeColor,
                              child: GestureDetector(
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 10,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(colors: [
                                      Colors.deepPurple,
                                      Colors.pink
                                    ]),
                                    border: Border.all(
                                      color: Colors.transparent,
                                    ),
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                        MediaQuery.of(context).size.width /
                                            300),
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: isButtonFocused == false
                                            ? const Color.fromARGB(
                                                255, 147, 149, 211)
                                            : Colors.transparent,
                                        border: Border.all(
                                            color: Colors.transparent),
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      child: Text(
                                        "Sign in",
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              10,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: () async {
                                  if (_formKey.currentState?.validate() ==
                                      true) {
                                    dynamic result =
                                        await _auth.signInWithEmailAndPassword(
                                            emailController.text,
                                            passwordController.text);
                                    if (result == null) {
                                      setState(() {
                                        error_message =
                                            "Could not sign with these credentials \nTry checking spelling";
                                      });
                                    } else {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  BlankPage()));
                                    }
                                  } else {
                                    print(
                                        "You didn't fill all required fields");
                                  }
                                },
                              ),
                            ),
                            const SmallBreakLine(
                              amount: 1,
                            ),
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                              ),
                              label: const Text("Sign in anonymously"),
                              onPressed: () async {
                                dynamic result = await _auth.signInAnon();
                                if (result == null) {
                                  print("Error signing in");
                                } else {
                                  print("Signed in anonymously");
                                  print(result.uid);
                                }
                              },
                              icon: const Icon(Icons.account_circle_outlined),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
            )));
  }
}
