// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticaret/service/Database.dart';
import 'package:flutter/material.dart';

import '../style/color.dart';

Widget SepetCard(Function()? ontap, QueryDocumentSnapshot doc, context) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      padding: const EdgeInsets.all(14),
      child: Wrap(runSpacing: 15, children: [
        Container(
          decoration: BoxDecoration(
              color: Appcolor2, borderRadius: BorderRadius.circular(15)),
          child: ListTile(
            leading: CircleAvatar(
                backgroundImage: AssetImage(
                    "assets/${doc.data().toString().contains("isim") ? doc.get("isim") : ""}.jpg")),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    doc.data().toString().contains("isim")
                        ? doc.get("isim")
                        : "",
                    style: const TextStyle(fontSize: 20, color: TextColor)),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                      "${doc.data().toString().contains("fiyat") ? doc.get("fiyat") : ""} ₺",
                      style: const TextStyle(fontSize: 20, color: TextColor)),
                ),
              ],
            ),
            subtitle: Row(
              children: [
                Text(
                    doc.data().toString().contains("detay")
                        ? doc.get("detay")
                        : "",
                    style: const TextStyle(fontSize: 18, color: TextColor2)),
                Padding(
                  padding: const EdgeInsets.only(left: 7),
                  child: Text(
                      doc.data().toString().contains("Urun Boyutu")
                          ? doc.get("Urun Boyutu")
                          : "",
                      style: const TextStyle(fontSize: 18, color: TextColor2)),
                ),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Appcolor2,
                        title: const Text(
                          "Silmek İstiyormusunuz",
                          style: TextStyle(color: Colors.white),
                        ),
                        content: const Text("Ürün Favorilerden Kaldırılıcak",
                            style: TextStyle(color: Colors.white)),
                        actions: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: EnabledColor),
                              onPressed: () {
                                deleteData(doc.id, "Sepet");
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("Ürün Kaldırıldı")));
                                Navigator.pop(context);
                              },
                              child: const Text("Evet")),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: EnabledColor),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Hayır")),
                        ],
                      );
                    });
              },
            ),
          ),
        ),
      ]),
    ),
  );
}
