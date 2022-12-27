// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticaret/screen/Details.dart';
import 'package:e_ticaret/widget/coffe_card.dart';
import 'package:flutter/material.dart';

class Kategori3 extends StatefulWidget {
  const Kategori3({super.key});

  @override
  State<Kategori3> createState() => _Kategori3State();
}

class _Kategori3State extends State<Kategori3> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("Milkshake").snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasData) {
              return GridView(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.6 / 2.5,
                    crossAxisSpacing: 10),
                children: snapshot.data!.docs
                    .map((kahve) => CoffeCard(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailsScreen(kahve)));
                        }, kahve, context))
                    .toList(),
              );
            }
            return const Text("Veri yok");
          }),
    );
  }
}
