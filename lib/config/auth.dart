import 'package:TuuzFlutter/app/login/login.dart';
import 'package:TuuzFlutter/tuuz/storage/storage.dart';
import 'package:TuuzFlutter/tuuz/win/close.dart';
import 'package:flutter/cupertino.dart';

class Auth {
  bool Is_login;

  Future<bool> Check_login() async {
    bool uid = await Storage().Has("__uid__");
    bool token = await Storage().Has("__token__");

    if (uid && token) {
      return true;
    } else {
      return false;
    }
  }

  bool Return_login_check_and_Goto(BuildContext context, Map json) {
    if (json["code"] == -1) {
      this.Is_login = false;
      Windows().Open(context, Login());
      return false;
    } else {
      this.Is_login = true;
      return true;
    }
  }

  bool Return_login_check(BuildContext context, Map json) {
    if (json["code"] == -1) {
      this.Is_login = false;
      return false;
    } else {
      this.Is_login = true;
      return true;
    }
  }

  void Go_to_Login(BuildContext context) {
    Windows().Open(context, Login());
  }
}
