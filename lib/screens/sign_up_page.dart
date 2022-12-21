import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_signup_system/services/auth.dart';
import 'package:login_signup_system/screens/blank_page.dart';
import 'package:login_signup_system/widgets/small_break_line.dart';
import 'package:login_signup_system/widgets/under_text.dart';
import '../widgets/form_field.dart';

void main() {
  runApp(const SignUpPage());
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 147, 149, 211),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 147, 149, 211),
          elevation: 0.0,

        ),
        body: Padding(
          padding: EdgeInsets.only(
              bottom: deviceHeight(context)/10),
          child: Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Sign up",
                                style: TextStyle(
                                  fontSize: deviceHeight(context) / 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SmallBreakLine(amount: 2,),
                              FormFieldWidget(
                                  controller: emailController,
                                  labelTextForm: "Email", type: "email",),
                              FormFieldWidget(
                                  controller: passwordController,
                                  labelTextForm: "Password", type: "password",),
                              SmallBreakLine(amount: 2,),
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
                                      padding: const EdgeInsets.all(2.0),
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
                                          "Become a member",
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context).size.width / 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: () async {
                                    if (_formKey.currentState?.validate() ==
                                        true) {
                                      dynamic result = await _auth
                                          .registerWithEmailAndPassword(
                                              emailController.text,
                                              passwordController.text);
                                      if(result!=null)
                                        {
                                          Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) => BlankPage()));
                                        }
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text("Register")));
                                    } else {
                                      print(
                                          "You didn't fill all required fields");
                                    }
                                  },
                                ),
                              ),

                            ],
                          ),
                        ),
                      ]),
                ),
              ),
        )
    );
  }
}
