import 'package:flutter/material.dart';

pushReplacement(context, Widget newScreen,) {
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => newScreen));
}

push(context, Widget newScreen) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => newScreen));
}

pushAndRemoveUntil(context, Widget newScreen) {
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => newScreen), (route) => false);
}
