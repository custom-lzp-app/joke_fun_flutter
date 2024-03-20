
import 'dart:convert';

import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:crypto/crypto.dart';

bool isPhoneNum(String text) {
  RegExp exp = RegExp( r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');
  return exp.hasMatch(text);
}

generateMd5(String data) {
  var content =  const Utf8Encoder().convert(data);
  var md5 = crypto.md5;
  var digest = md5.convert(content);
  return hex.encode(digest.bytes);
}

String getPassword(String name, String pwd) {
  String txt = '$name + druid + $pwd + heifeng';
  var bytes = utf8.encode(txt); // encode the input string to UTF-8
  var digest = sha256.convert(bytes); // get the SHA256 digest
  return digest.toString();
}