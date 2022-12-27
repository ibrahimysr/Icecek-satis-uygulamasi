// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../style/color.dart';

// ignore: non_constant_identifier_names
Widget Buttons(String Boyut, Function()? ontap, bool tercih) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          side: BorderSide(width: 3, color: tercih ? EnabledColor : Appcolor2),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          backgroundColor: Appcolor),
      onPressed: ontap,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Text(Boyut,
            style: TextStyle(
                color: tercih ? EnabledColor : Colors.white, fontSize: 16)),
      ));
}
