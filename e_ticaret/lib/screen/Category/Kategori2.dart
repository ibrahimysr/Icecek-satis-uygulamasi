// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticaret/screen/Details.dart';
import 'package:e_ticaret/widget/coffe_card.dart';
import 'package:flutter/material.dart';

class Kategori2 extends StatefulWidget {
  const Kategori2({super.key});

  @override
  State<Kategori2> createState() => _Kategori2State();
}

class _Kategori2State extends State<Kategori2> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("Soguklar").snapshots(),
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
