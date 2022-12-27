// ignore_for_file: file_names

import 'package:e_ticaret/screen/Category/Kategori2.dart';
import 'package:e_ticaret/screen/Category/Kategory3.dart';
import 'package:e_ticaret/style/color.dart';

import 'package:e_ticaret/widget/kategory_button.dart';
import 'package:flutter/material.dart';

import 'Category/Kategori1.dart';

class AnaEkran extends StatefulWidget {
  const AnaEkran({Key? key}) : super(key: key);

  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  TextEditingController arama = TextEditingController();

  int index = 0;
  bool selectbutonone = true;
  bool selectbuttontwo = false;
  bool selectbuttonthre = false;
  String name = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Appcolor,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 44),
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xff232732),
                      borderRadius: BorderRadius.circular(10)),
                  height: 42,
                  width: 44,
                  child: IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: const Icon(
                        Icons.menu,
                        color: Appcolor2,
                      )),
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 33,
                ),
                child: Text(
                  "En İyisini Bul",
                  style: TextStyle(
                      color: TextColor, fontSize: 30, fontFamily: 'Schyler'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 33,
                ),
                child: Text(
                  "İçecekler Senin İçin",
                  style: TextStyle(
                      color: TextColor, fontSize: 30, fontFamily: 'Schyler'),
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 33, right: 58),
                child: TextField(
                  controller: arama,
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                      fillColor: const Color(0xff282C34),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 3, color: Colors.black),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 3, color: Colors.black),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color(0xff52575D),
                      ),
                      hintText: "İstediğin Kahveyi Ara",
                      hintStyle: const TextStyle(
                          color: Color(0xff52575D), fontSize: 13)),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Padding(
                  padding: const EdgeInsets.only(left: 36),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        KategoryButton("Sıcaklar", () {
                          setState(() {
                            index = 0;
                            selectbutonone = !selectbutonone;
                            selectbuttonthre = false;
                            selectbuttontwo = false;
                          });
                        }, selectbutonone),
                        Padding(
                          padding: const EdgeInsets.only(left: 27, right: 27),
                          child: KategoryButton("Soğuklar", () {
                            setState(() {
                              index = 1;
                              selectbuttontwo = !selectbuttontwo;
                              selectbutonone = false;
                              selectbuttonthre = false;
                            });
                          }, selectbuttontwo),
                        ),
                        KategoryButton("Milkshake", () {
                          setState(() {
                            index = 2;
                            selectbuttonthre = !selectbuttonthre;
                            selectbutonone = false;
                            selectbuttontwo = false;
                          });
                        }, selectbuttonthre),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 21,
                ),
                IndexedStack(
                  index: index,
                  children:const  [
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Kategori1(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Kategori2(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Kategori3(),
                    )
                  ],
                )
              ])
            ],
          ),
        ),
      ),
    );
  }
}
