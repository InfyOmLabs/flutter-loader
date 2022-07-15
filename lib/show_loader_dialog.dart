import 'package:flutter/services.dart';

class CommonDialog {
  static const platForm = MethodChannel("infyom.com/flutter");
  static Future showLoader(bool isTrue) async {
    final argument = {"loaderShow": isTrue};
    await platForm.invokeMethod("showLoader", argument);
  }
}
