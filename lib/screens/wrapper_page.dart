import 'package:flutter/cupertino.dart';
import 'package:login_signup_system/models/user.dart';
import 'package:login_signup_system/screens/blank_page.dart';
import 'package:provider/provider.dart';

import 'sign_in_page.dart';

class Wrapper extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    final user = Provider.of<User_Fire?>(context);
    if (user==null)
      {
        return SignIn();
      }
    else{
      return BlankPage();
    }
  }
}