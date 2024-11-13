import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:shop_mart/pages/Order.dart';
import 'package:shop_mart/pages/home.dart';
import 'package:shop_mart/pages/profile.dart';
import 'package:shop_mart/pages/wallet.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const Wallet(),
    const Order(),
    const Profile(),
  ];
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: SalomonBottomBar(
        curve: Easing.standard,
        itemShape: const StadiumBorder(),
        unselectedItemColor:Colors.redAccent ,
        selectedItemColor: const Color.fromRGBO(109, 203, 192, 1),
        backgroundColor: const Color.fromRGBO(65, 70, 69, 1),
        currentIndex: _selectedIndex,
        onTap: (i) => setState(() => _selectedIndex = i),
        items:[
         SalomonBottomBarItem(
          icon: const Icon(Icons.home), title: const Text("Home")),

        SalomonBottomBarItem(
          icon: const Icon(Icons.wallet_outlined), title: const Text("Wallet")), // Added 'const' here
        
        SalomonBottomBarItem(
          icon: const Icon(Icons.shop), title: const Text("Order")),

        SalomonBottomBarItem(icon: const Icon(Icons.person_2_sharp), title: const Text("Profile"))
        
        
        ]
        ),
      /*bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.orange,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),*/
    );
  }
}