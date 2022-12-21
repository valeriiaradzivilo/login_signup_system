import 'package:flutter/material.dart';
import 'package:login_signup_system/screens/sign_up_page.dart';

class UnderText extends StatefulWidget {
  final String text;
  final StatefulWidget page;
  final Icon icon;



  const UnderText({required this.text, required this.page, required this.icon});

  @override
  _UnderTextState createState() => _UnderTextState();
}

class _UnderTextState extends State<UnderText> {
  var isTextUnderl = false;
  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

  void _onEnterChangeText(PointerEvent details) {
    setState(() {
      isTextUnderl = !isTextUnderl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _onEnterChangeText,
      onExit: _onEnterChangeText,
      child:  Padding(
              padding: const EdgeInsets.all(2.0),
              child: ElevatedButton.icon(
                onPressed: ()
                {
                  setState(() {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text(
                            "New user, signing up")));
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => widget.page));
                  });
                },
                label: Text(widget.text,
                  style: TextStyle(decoration: isTextUnderl?TextDecoration.underline:null,
                      fontSize: deviceWidth(context)/18),
                  textAlign: TextAlign.center,

                ),
                icon: widget.icon,
              ),
            ),
    );
  }
}
