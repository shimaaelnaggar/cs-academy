import 'package:flutter/material.dart';

void snackBar({required String text, required context}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(text), duration: const Duration(seconds: 2)),
  );
}
