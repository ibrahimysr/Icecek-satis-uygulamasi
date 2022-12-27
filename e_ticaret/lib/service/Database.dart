// ignore_for_file: non_constant_identifier_names, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screen/Loginpage.dart';

deleteData(id, String Referans) async {
  await FirebaseFirestore.instance.collection(Referans).doc(id).delete();
}

AddFavoriData(QueryDocumentSnapshot doc) async {
  FirebaseFirestore.instance.collection("Favoriler").add({
    "isim": doc["isim"],
    "detay": doc["detay"],
    "acıklama": doc["acıklama"],
    "fiyat": doc["fiyat"],
  });
}

addSepetData(QueryDocumentSnapshot doc, String UrunBoyutu,String UrunFiyat) {
  FirebaseFirestore.instance.collection("Sepet").add({
    "isim": doc["isim"],
    "detay": doc["detay"],
    "acıklama": doc["acıklama"],
    "fiyat": UrunFiyat,
    "Urun Boyutu": UrunBoyutu
  });
}
Signup(TextEditingController Email, TextEditingController Sifre,
    TextEditingController KullaniciAdi, context) async {
  await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: Email.text, password: Sifre.text)
      .then((value) => {
            FirebaseFirestore.instance.collection("Kullanıcılar").add({
              "email": Email.text,
              "Sifre": Sifre.text,
              "Kullanıcı Adı": KullaniciAdi.text
            }),
            Navigator.pop(context)
          });
}
Future<User?> LoginFunction(
    String Email, String Sifre, BuildContext context) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;
  try {
    UserCredential userCredential =
        await auth.signInWithEmailAndPassword(email: Email, password: Sifre);
    user = userCredential.user;
  } on FirebaseException catch (e) {
    if (e.code == "user-not-found") {
      // ignore: avoid_print
      print("No user found that email");
    }
  }

  return user;
}
Future<void> signOut(context) async {
  final FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut().then((value) => {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const LoginPage()))
        });
  }
