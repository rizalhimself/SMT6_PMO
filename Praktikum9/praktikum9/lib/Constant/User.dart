import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:praktikum9/Constant/Bantuan.dart';
import 'package:praktikum9/Constant/UserAdd.dart';
import 'package:praktikum9/Constant/UserEditDelete.dart';

import 'Ukuran.dart';

class User extends StatefulWidget {
  const User({Key? key}) : super(key: key);

  @override
  State<User> createState() {
    // TODO: implement createState
    return _UserState();
  }
}

class _UserState extends State<User> {
  List widgets = [];
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void onResume() {
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Latihan HTTP", style: TextStyle(fontSize: ukurnHurufJudul)),
              Text('Tambah Users',
                  style: TextStyle(fontSize: ukurnHurufSubJudul))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return UserAdd();
            }));
          },
          child: Icon(Icons.add),
        ),
        body: RefreshIndicator(child:
            ListView.builder(itemBuilder: (BuildContext context, int position) {
          return getRow(position);
        }), onRefresh: () {
          return Future.delayed(Duration(seconds: 1), () {
            setState(() {
              loadData();
            });
          });
        }));
  }

  Widget getRow(int i) {
    return Padding(
      padding: EdgeInsets.all(0.0),
      child: GestureDetector(
        onTap: () {
          gid = widgets[i]["id"];
          gusername = widgets[i]["username"];
          gfirstname = widgets[i]["firstname"];
          glastname = widgets[i]["lastname"];
          gaddress = widgets[i]["address"];
          gage = widgets[i]["age"];

          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return UserEditDelete();
          }));
        },
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${widgets[i]["username"]}",
                  style: TextStyle(fontSize: ukurnHurufIDIsiList)),
              Text("${widgets[i]["password"]}",
                  style: TextStyle(fontSize: ukurnHurufIDIsiList)),
              Text("${widgets[i]["firstname"]}",
                  style: TextStyle(fontSize: ukurnHurufIsiList)),
              Text("${widgets[i]["lastname"]}",
                  style: TextStyle(fontSize: ukurnHurufIsiList)),
              Text("${widgets[i]["address"]}",
                  style: TextStyle(fontSize: ukurnHurufIsiList)),
              Text("${widgets[i]["age"]}",
                  style: TextStyle(fontSize: ukurnHurufIsiList)),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> loadData() async {
    var dataURL = Uri.parse(BaseUrl + 'users');
    http.Response response = await http.get(dataURL);
    setState(() {
      widgets = jsonDecode(response.body);
    });
  }
}
