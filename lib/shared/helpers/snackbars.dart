import 'package:flutter/material.dart';

import 'package:another_flushbar/flushbar.dart';

void showTextSnackbar(
  BuildContext context,
  String text, {
  Duration? duration = const Duration(milliseconds: 2000),
}) {
  Flushbar(
    message: text,
    margin: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 16,
    ),
    borderRadius: BorderRadius.circular(8),
    duration: duration,
  ).show(context);
}
