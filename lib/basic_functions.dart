import 'package:flutter/material.dart';


class BasicFunctions {
  static void printSomething(String something) {
    print(something);
  }

  static void showAlertDialog(
      BuildContext context, String title, String message) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        // Navigator.pop(context);
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static void showAlertDialogTOView(
      BuildContext context, String title, String message) {
    // ignore: unused_local_variable
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        // final navigatorKey = GlobalKey<NavigatorState>();
        // Navigator.pop(context);
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static void showAlertDialogToShare(
      BuildContext context, String title, String message) {
    Widget okButton = FlatButton(
      child: Text("SHARE"),
      onPressed: () {
        // Share.share('check out my website https://example.com',
        //     subject: 'Look what I made!');
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  //
  // static Future<void> _makePhoneCall(String url) async {
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  static void makePhoneCall(String s) {
    //_makePhoneCall(s);
  }



}
