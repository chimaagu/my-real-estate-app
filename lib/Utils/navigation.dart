import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

nextPage(BuildContext context, Widget page) {
  return Navigator.push(
    context,
    CupertinoPageRoute(builder: (context) => page),
  );
}

previousPage(BuildContext context) {
  return Navigator.pop(context);
}
