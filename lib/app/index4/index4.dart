import 'dart:convert';
import 'dart:ui';

import 'package:TuuzFlutter/app/index1/help/help.dart';
import 'package:TuuzFlutter/app/index1/robot_info/robot_info.dart';
import 'package:TuuzFlutter/config/auth.dart';
import 'package:TuuzFlutter/config/url.dart';
import 'package:TuuzFlutter/extend/authaction/authaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:TuuzFlutter/app/login/login.dart';
import 'package:TuuzFlutter/config/config.dart';
import 'package:TuuzFlutter/tuuz/alert/ios.dart';
import 'package:TuuzFlutter/tuuz/net/net.dart';
import 'package:TuuzFlutter/tuuz/popup/popupmenu.dart';
import 'package:TuuzFlutter/tuuz/storage/storage.dart';
import 'package:TuuzFlutter/tuuz/win/close.dart';

class Index4 extends StatefulWidget {
  String _title;

  Index4(this._title);

  @override
  _Index4 createState() => _Index4(this._title);
}

class _Index4 extends State<Index4> {
  String _title;

  _Index4(this._title);

  @override
  void initState() {
    get_data();
    super.initState();
  }

  @override
  Future<void> get_data() async {
    setState(() {
      // bot_datas = [];
    });
    Map<String, String> post = await AuthAction().LoginObject();
    var ret = await Net().Post(Config().Url, Url().User_info, null, post, null);
    Map json = jsonDecode(ret);
    if (Auth().Return_login_check(context, json)) {
      if (json["code"] == 0) {
      } else {
        Alert().Error(context, json["data"], () {});
      }
    }
  }

  Map User_info = {};

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this._title),
        backgroundColor: Colors.black,
        centerTitle: true,
        actions: <Widget>[],
      ),
    );
  }
}
