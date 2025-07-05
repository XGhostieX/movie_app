import 'package:flutter/material.dart';

void displayMessage(String message, BuildContext context) {
  var snackBar = SnackBar(
    content: Text(message),
    behavior: SnackBarBehavior.floating,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
