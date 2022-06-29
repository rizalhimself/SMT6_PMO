// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:praktikum5/Widget/Bahasa.dart';
import 'package:praktikum5/Widget/Pemisah.dart';

import '../Widget/JenisKelamin.dart';
import '../Widget/StatusPernikahan.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() {
    return _HomeState();
  }
}

int _selectedIndex = 0;

class _HomeState extends State<Home> {
  void _itemDiTap(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 2) {
        _kirimData();
      } else if (index == 3) {
        _kosongkan();
      } else if (index == 4) {
        exit(0);
      }
    });
  }

  void _kirimData() {
    AlertDialog alertDialog = AlertDialog(
      content: Container(
        width: 100.0,
        height: 200.0,
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("OK")),
                ),
                Text("Jenis Kelamin : " + jenisKelaminDipilih),
                Text("Status : " + statusPernikahanDipilih),
                Text("Kemampuan Berbahasa : " + cariBahasa()),
              ],
            )
          ],
        ),
      ),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      },
    );
  }

  void _kosongkan() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.list),
          title: const Text("Latihan Formulir"),
          backgroundColor: Colors.teal,
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
        ),
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(10.1),
              child: Column(
                children: [
                  JenisKelamin(),
                  Pemisah(),
                  StatusPernikahan(),
                  Pemisah(),
                  Bahasa(),
                  Pemisah(),
                  ElevatedButton(
                      onPressed: () {
                        _kirimData();
                      },
                      child: const Text("Proses")),
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Favorite"),
            BottomNavigationBarItem(icon: Icon(Icons.camera), label: "Camera"),
            BottomNavigationBarItem(icon: Icon(Icons.check), label: "Proses"),
            BottomNavigationBarItem(
                icon: Icon(Icons.clear), label: "Kosongkan"),
            BottomNavigationBarItem(
                icon: Icon(Icons.exit_to_app), label: "Keluar"),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _itemDiTap,
        ));
  }
}
