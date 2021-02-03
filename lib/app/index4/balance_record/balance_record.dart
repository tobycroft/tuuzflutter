import 'dart:convert';
import 'dart:ui';

import 'package:TuuzFlutter/app/index4/balance_record/url_balance_record.dart';
import 'package:TuuzFlutter/app/index4/url_index4.dart';
import 'package:TuuzFlutter/config/auth.dart';
import 'package:TuuzFlutter/config/res.dart';
import 'package:TuuzFlutter/extend/authaction/authaction.dart';
import 'package:TuuzFlutter/tuuz/win/close.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:TuuzFlutter/config/config.dart';
import 'package:TuuzFlutter/tuuz/alert/ios.dart';
import 'package:TuuzFlutter/tuuz/net/net.dart';

class Balance_record extends StatefulWidget {
  String _title;

  Balance_record(this._title);

  @override
  _Balance_record createState() => _Balance_record(this._title);
}

class _Balance_record extends State<Balance_record> {
  String _title;

  _Balance_record(this._title);

  @override
  void initState() {
    get_balance_record();
    super.initState();
  }

  @override
  Future<void> get_balance_record() async {
    Map<String, String> post = await AuthAction().LoginObject();
    var ret = await Net().Post(Config().Url, Url_balance_record().User_balance, null, post, null);
    Map json = jsonDecode(ret);
    if (Auth().Return_login_check(context, json)) {
      if (json["code"] == 0) {
        _balance_record = json["data"];
        setState(() {});
        print(_balance_record);
      } else {
        Alert().Error(context, json["data"], () {});
      }
    }
  }

  List _balance_record = [];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this._title),
        backgroundColor: Colors.black,
        centerTitle: true,
        actions: <Widget>[],
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.blueGrey,
          ),
        ],
      ),
    );
  }
}
