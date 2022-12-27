// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../style/color.dart';


Widget DetailsContainer(Icon Icon, String Title) {
  return Container(
    decoration:
        BoxDecoration(color: Appcolor, borderRadius: BorderRadius.circular(10)),
    child: Padding(
      padding: const EdgeInsets.only(left: 7, right: 7, top: 7, bottom: 5),
      child: Column(
        children: [
          Icon,
          Text(
            Title,
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    ),
  );
}


Widget HeaderContainers(Icon Icon,Function()? ontap) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, top: 20),
    child: Container(
      decoration: BoxDecoration(
          color: Appcolor, borderRadius: BorderRadius.circular(15)),
      child: IconButton(
        onPressed:ontap,
        icon: Icon,
      ),
    ),
  );
}
