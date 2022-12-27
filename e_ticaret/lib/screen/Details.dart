// ignore_for_file: file_names, non_constant_identifier_names, must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticaret/service/Database.dart';
import 'package:e_ticaret/style/color.dart';
import 'package:e_ticaret/widget/Button.dart';
import 'package:e_ticaret/widget/mini_container.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen(this.doc, {super.key});

  QueryDocumentSnapshot doc;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool KucukBoy = true;
  bool OrtaBoy = false;
  bool BuyukBoy = false;

  String UrunBoyutu = "Küçük Boy";
  String UrunFiyat = "";
  @override
  Widget build(BuildContext context) {
    if (KucukBoy == true) {
      UrunFiyat = widget.doc["fiyat"];
    } else if (OrtaBoy == true) {
      UrunFiyat = (int.parse(widget.doc["fiyat"]) + 10).toString();
    } else if (BuyukBoy == true) {
      UrunFiyat = (int.parse(widget.doc["fiyat"]) + 20).toString();
    }
    return SafeArea(
        child: Scaffold(
      backgroundColor: Appcolor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(27.0),
              child: Container(
                width: 321,
                height: 380,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image:
                            AssetImage("assets/${widget.doc["detay"]}.jpg"))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HeaderContainers(
                          const Icon(Icons.arrow_back_ios_new_outlined,
                              color: TextColor2),
                          () {
                            Navigator.pop(context);
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: HeaderContainers(
                              const Icon(Icons.favorite, color: TextColor2),
                              () {
                            AddFavoriData(widget.doc);
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text("Ürününüz Favorilere Eklendi")));
                          }),
                        )
                      ],
                    ),
                    Container(
                      height: 125,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(30),
                          ),
                          color: Colors.black.withOpacity(0.4)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 28),
                              child: Text(
                                widget.doc["isim"],
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 24),
                              ),
                            ),
                            Text(
                              widget.doc["detay"],
                              style: const TextStyle(
                                  color: Color(0xffA99A97), fontSize: 17),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [],
                            ),
                            const SizedBox(
                              height: 21,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Text(
                    "Tanım",
                    style: TextStyle(color: Color(0xffA99A97), fontSize: 18),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Text(widget.doc["acıklama"],
                      style:
                          const TextStyle(color: Colors.white, fontSize: 17)),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Buttons("Küçük", () {
                        setState(() {
                          KucukBoy = true;
                          OrtaBoy = false;
                          BuyukBoy = false;
                          UrunBoyutu = "Küçük Boy";
                        });
                      }, KucukBoy),
                      Buttons("Orta", () {
                        setState(() {
                          KucukBoy = false;
                          OrtaBoy = true;
                          BuyukBoy = false;
                          UrunBoyutu = "Orta Boy";
                        });
                      }, OrtaBoy),
                      Buttons("Büyük", () {
                        setState(() {
                          KucukBoy = false;
                          OrtaBoy = false;
                          BuyukBoy = true;
                          UrunBoyutu = "Büyük Boy";
                        });
                      }, BuyukBoy)
                    ]),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Column(
                        children: [
                          const Text("Fiyat",
                              style: TextStyle(
                                  color: Color(0xffA99A97), fontSize: 18)),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                UrunFiyat,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              const Text(
                                "₺",
                                style: TextStyle(
                                    color: EnabledColor, fontSize: 20),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: SizedBox(
                        height: 47,
                        width: 160,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                backgroundColor: EnabledColor),
                            onPressed: () {
                              addSepetData(widget.doc, UrunBoyutu, UrunFiyat);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Ürün Sepete Eklendi")));
                              Navigator.pop(context);
                            },
                            child: const Text("Sepete Ekle",
                                style: TextStyle(fontSize: 18))),
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
