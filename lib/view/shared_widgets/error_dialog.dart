import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

errorDialog(body, context) {
  AwesomeDialog(
    animType: AnimType.scale,
    dialogType: DialogType.error,
    title: 'Failed',
    desc: body,
    btnOkColor: Colors.red,
    btnOkOnPress: () {},
    context: context,
  ).show();
}
