import 'package:flutter/material.dart';

void dialogMessage(type, message, context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(message),
        icon: Icon(
          type == 'success'
              ? Icons.check_circle
              : Icons.notification_important_sharp,
          color: type == 'success' ? Colors.green : Colors.red,
        ),
      );
    },
  );
}
