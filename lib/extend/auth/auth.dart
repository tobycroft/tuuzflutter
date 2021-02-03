import 'package:TuuzFlutter/tuuz/storage/storage.dart';
import 'package:flutter/material.dart';

class Auth {
  LoginObject() async {
    Map<String, String> post = {};
    post["uid"] = await Storage().Get("__uid__");
    post["token"] = await Storage().Get("__token__");
    return post;
  }
}
