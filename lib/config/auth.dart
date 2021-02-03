import 'package:TuuzFlutter/app/login/login.dart';
import 'package:TuuzFlutter/tuuz/win/close.dart';
import 'package:flutter/cupertino.dart';

class Auth {
  bool Is_login = false;

  bool Return_login_check_and_Goto(BuildContext context, Map json) {
    if (json["code"] == -1) {
      Windows().Open(context, Login());
      return false;
    } else {
      return true;
    }
  }

  bool Return_login_check(BuildContext context, Map json) {
    if (json["code"] == -1) {
      return false;
    } else {
      return true;
    }
  }
}
