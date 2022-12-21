import 'package:flutter/material.dart';
import 'package:login_signup_system/screens/blank_page.dart';

class SignButton extends StatefulWidget {
  final String text;
  final functionButton;
  // final StatefulWidget page;

  SignButton({required this.text, required this.functionButton});

  @override
  _SignButtonState createState() => _SignButtonState();
}

class _SignButtonState extends State<SignButton> {
  var isButtonFocused = false;

  void _onEnterChangeColor(PointerEvent details) {
    setState(() {
      isButtonFocused = !isButtonFocused;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _onEnterChangeColor,
      onExit: _onEnterChangeColor,
      child: GestureDetector(
        child: Container(
          height: MediaQuery.of(context).size.height / 10,
          decoration: BoxDecoration(
            gradient:
                const LinearGradient(colors: [Colors.deepPurple, Colors.pink]),
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
                    ? const Color.fromARGB(255, 147, 149, 211)
                    : Colors.transparent,
                border: Border.all(color: Colors.transparent),
                borderRadius: BorderRadius.circular(32),
              ),
              child: Text(
                widget.text,
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ),
        ),
        onTap: () {
          setState(() {
            widget.functionButton;
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Tap ${widget.text}")));
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => BlankPage()));

          });
        },
      ),
    );
  }

}
