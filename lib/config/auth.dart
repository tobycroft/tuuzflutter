import 'package:TuuzFlutter/app/login/login.dart';
import 'package:TuuzFlutter/tuuz/win/close.dart';
import 'package:flutter/cupertino.dart';

class Auth {
  bool Is_login = false;

  bool login(BuildContext context, Map json) {
    if (json["code"] == -1) {
      Windows().Open(context, Login());
      return false;
    } else {
      return true;
    }
  }
}
