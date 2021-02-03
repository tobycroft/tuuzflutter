import 'dart:convert';
import 'dart:ui';

import 'package:TuuzFlutter/app/index1/help/help.dart';
import 'package:TuuzFlutter/app/index1/robot_info/robot_info.dart';
import 'package:TuuzFlutter/config/auth.dart';
import 'package:TuuzFlutter/config/res.dart';
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
    Map<String, String> post = await AuthAction().LoginObject();
    var ret = await Net().Post(Config().Url, Url().User_info, null, post, null);
    Map json = jsonDecode(ret);
    if (Auth().Return_login_check(context, json)) {
      if (json["code"] == 0) {
        setState(() {
          User_info = json["data"];
        });
        print(User_info);
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
      body: ListView(
        children: [
          Container(
            height: 120,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  color: Colors.blue,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  alignment: Alignment.centerLeft,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      Res().Index4_head_img,
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        User_info["uname"].toString(),
                        style: Config().Text_style_Name,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        User_info["qq"].toString(),
                        style: Config().Text_style_Name,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.keyboard_arrow_right),
                )
              ],
            ),
          ),
          GridView.count(
              padding: EdgeInsets.all(0),
              physics: new NeverScrollableScrollPhysics(),
              //增加
              shrinkWrap: true,
              //增加
              crossAxisCount: 3,
              children: <Widget>[
                Container(
                  width: 100,
                  color: Colors.grey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.settings,
                        size: 80,
                      ),
                      Text(
                        "设定",
                        style: Config().Text_Style_default,
                      )
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  color: Colors.green,
                ),
                Container(
                  width: 100,
                  color: Colors.red,
                ),
              ]),
          Container(
            height: 600,
            color: Colors.blueGrey,
          ),
        ],
      ),
    );
  }
}