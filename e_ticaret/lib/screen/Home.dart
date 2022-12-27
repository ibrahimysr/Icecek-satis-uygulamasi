// ignore_for_file: file_names

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:e_ticaret/screen/Anaekran.dart';
import 'package:e_ticaret/screen/Favori.dart';
import 'package:e_ticaret/screen/Sepet.dart';
import 'package:e_ticaret/service/Database.dart';

import 'package:e_ticaret/style/color.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [MenuHeader(), MenuItems()],
          ),
        ),
      ),
      body: SizedBox(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: const <Widget>[AnaEkran(), Favoriler(), Sepet()],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Appcolor,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              activeColor: EnabledColor,
              inactiveColor: Appcolor2,
              title: const Text('Ana Ekran'),
              icon: const Icon(
                Icons.home,
              )),
          BottomNavyBarItem(
              activeColor: EnabledColor,
              inactiveColor: Appcolor2,
              title: const Text('Favoriler'),
              icon: const Icon(Icons.favorite)),
          BottomNavyBarItem(
              activeColor: EnabledColor,
              inactiveColor: Appcolor2,
              title: const Text('Sepet'),
              icon: const Icon(Icons.shopping_basket)),
        ],
      ),
    );
  }
}

class MenuHeader extends StatelessWidget {
  const MenuHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Appcolor2,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: SingleChildScrollView(
        child: Column(
          children: const [
            CircleAvatar(
              backgroundImage: AssetImage("assets/login.jpg"),
              radius: 52,
            ),
            SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItems extends StatelessWidget {
  const MenuItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        runSpacing: 16,
        children: [
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => const HomePage())));
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text("Favoriler"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => const Favoriler())));
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_basket),
            title: const Text("Sepet"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => const Sepet())));
            },
          ),
          const Divider(
            color: Colors.black54,
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Ayarlar"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text("Hata Bildirimi"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text("Çıkış Yap"),
            onTap: () {
              signOut(context);
            },
          )
        ],
      ),
    );
  }
}
