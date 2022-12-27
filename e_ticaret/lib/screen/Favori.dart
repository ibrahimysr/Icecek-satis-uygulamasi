// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticaret/style/color.dart';
import 'package:e_ticaret/widget/Favori_card.dart';

import 'package:flutter/material.dart';

import 'Details.dart';

class Favoriler extends StatefulWidget {
  const Favoriler({super.key});

  @override
  State<Favoriler> createState() => _FavorilerState();
}

class _FavorilerState extends State<Favoriler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Wrap(
            children: [
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Center(
                  child: Text(
                    "Favorilerim",
                    style: TextStyle(
                        fontSize: 30, color: TextColor, fontFamily: 'Schyler'),
                  ),
                ),
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("Favoriler")
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasData) {
                      return ListView(
                        shrinkWrap: true,
                        children: snapshot.data!.docs
                            .map((kahve) => FavoriCard(() {
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
      ),
    );
  }
}
