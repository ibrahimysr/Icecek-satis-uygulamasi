// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticaret/style/color.dart';
import 'package:e_ticaret/widget/seper_card.dart';
import 'package:flutter/material.dart';
import 'Details.dart';

class Sepet extends StatefulWidget {
  const Sepet({super.key});

  @override
  State<Sepet> createState() => _SepetState();
}

class _SepetState extends State<Sepet> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Appcolor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Center(
                      child: Text(
                        "Sepetim",
                        style: TextStyle(
                            fontSize: 30,
                            color: TextColor,
                            fontFamily: 'Schyler'),
                      ),
                    ),
                  ),
                  StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("Sepet")
                          .snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (snapshot.hasData) {
                          return ListView(
                            shrinkWrap: true,
                            children: snapshot.data!.docs
                                .map((kahve) => SepetCard(() {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailsScreen(kahve)));
                                    }, kahve, context))
                                .toList(),
                          );
                        } else {
                          return const Text("Favori Ürününüz Yok");
                        }
                      }),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 50,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 50),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: EnabledColor),
                  child: const Center(
                    child: Text(
                      "Ödeme Yap",
                      style: TextStyle(color: Colors.white, fontSize: 21),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
