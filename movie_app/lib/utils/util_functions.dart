import 'package:flutter/material.dart';

class UtilFunctions {
  //---------navoigator function
  static void navigateTo(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }

  static void goBack(BuildContext context) {
    Navigator.pop(context);
  }
}
