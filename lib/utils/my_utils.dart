import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyUtils {
  static showSnackBar(BuildContext context, String? text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text ?? ""),
        backgroundColor: Colors.blue,
      ),
    );
  }

  static getMyToast({required String message}) => Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM_RIGHT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey.shade300,
        textColor: Colors.black,
        fontSize: 16.0,
      );

  static showLoader(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          return const Center(child: CircularProgressIndicator());
        });
  }

  static hexColor(String colorhexcode) {
    String colornew = '0xff$colorhexcode';
    colornew = colornew.replaceAll(")", "");
    int colorint = int.parse(colornew);
    return colorint;
  }

  static String getPhoneNumber(String number) {
    return number.replaceAll(RegExp(r"\s|-|[()]+"), "");
  }

  static void fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static Future<bool?> getUrlOpenFailToast() {
    return Fluttertoast.showToast(
      msg: "Can't open Url",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.black,
      fontSize: 16.0,
    );
  }
}

String getFileType(String url) {
  String type = url.substring(url.length - 5, url.length);
  if (url.contains(".pdf")) {
    type = ".pdf";
  } else if (url.contains(".PDF")) {
    type = ".PDF";
  } else if (url.contains(".jpg")) {
    type = ".jpg";
  } else if (url.contains(".JPG")) {
    type = ".JPG";
  } else if (url.contains(".docx")) {
    type = ".docx";
  } else if (url.contains(".doc")) {
    type = ".doc";
  } else if (url.contains(".jpeg")) {
    type = ".jpeg";
  } else if (url.contains(".mp3")) {
    type = ".mp3";
  } else if (url.contains(".mp4")) {
    type = ".mp4";
  } else if (url.contains(".webp")) {
    type = ".webp";
  } else if (url.contains(".png")) {
    type = ".png";
  } else if (url.contains(".PNG")) {
    type = ".PNG";
  } else if (url.contains(".avif")) {
    type = ".avif";
  }

  return type;
}

String getJobType(int index) {
  if (index == 0) {
    return tr("part_time");
  } else if (index == 1) {
    return tr("full_time");
  } else {
    return tr("any");
  }
}

String getFromWhere(int index) {
  if (index == 0) {
    return tr("from_home");
  } else if (index == 1) {
    return tr("from_office");
  } else {
    return tr("any");
  }
}

InputDecoration getInputDecoration({required String label}) {
  return InputDecoration(
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.withOpacity(0.3), width: 2),
        borderRadius: BorderRadius.circular(100)),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.withOpacity(0.1), width: 2),
      borderRadius: BorderRadius.circular(100),
    ),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.withOpacity(0.1), width: 2),
        borderRadius: BorderRadius.circular(100)),
    errorBorder: InputBorder.none,
    disabledBorder: InputBorder.none,
    hintText: label,
    focusColor: Colors.white,
    hintStyle: TextStyle(color: Colors.grey.withOpacity(0.4)),
    filled: true,
    fillColor: Colors.white,
  );
}
