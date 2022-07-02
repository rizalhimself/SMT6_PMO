import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:praktikum9/Api/Api.dart';
import 'package:praktikum9/Constant/Bantuan.dart';
import 'package:praktikum9/Constant/Ukuran.dart';

import 'ConstantColor.dart';

class UserEditDelete extends StatefulWidget {
  const UserEditDelete({Key? key}) : super(key: key);

  @override
  State<UserEditDelete> createState() {
    // TODO: implement createState
    return _UserEditDeleteState();
  }
}

class _UserEditDeleteState extends State<UserEditDelete> {
  TextEditingController controllerid = TextEditingController();
  TextEditingController controllerusername = TextEditingController();
  TextEditingController controllerpassword = TextEditingController();
  TextEditingController controllerfirstname = TextEditingController();
  TextEditingController controllerlastname = TextEditingController();
  TextEditingController controlleraddress = TextEditingController();
  TextEditingController controllerage = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      controllerid.text = gid;
      controllerusername.text = gusername;
      controllerpassword.text = gpassword;
      controllerfirstname.text = gfirstname;
      controllerlastname.text = glastname;
      controlleraddress.text = gaddress;
      controllerage.text = gage;
    });
  }

  _edit() {
    var data = {
      'username': controllerusername.text,
      'password': controllerpassword.text,
      'firstname': controllerfirstname.text,
      'lastname': controllerlastname.text,
      'address': controlleraddress.text,
      'age': controllerage.text
    };
    var res = CallApi().putData(data, 'users/' + controllerid.text, context);
    Navigator.pop(context);
  }

  _hapus() async {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text("Hapus Data"),
            content: Text("Aoakah anda yakin?"),
            actions: [
              TextButton(
                  onPressed: () async {
                    var data = {
                      'jenis': 'hapus',
                      'idUser': controllerusername.text,
                    };
                    var res = CallApi()
                        .delData(data, 'users/' + controllerid.text, context);

                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: const Text('Ya')),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: const Text('Tidak'))
            ],
          );
        });
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
              Text(
                "Latihan HTTP",
                style: TextStyle(fontSize: ukurnHurufJudul),
              ),
              Text("Update Users",
                  style: TextStyle(fontSize: ukurnHurufSubJudul))
            ],
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                        label: Text("Id"), hintText: "Id"),
                    controller: controllerid,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                        label: Text("User Name"), hintText: "Username"),
                    controller: controllerusername,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                        label: Text("Password"), hintText: "Password"),
                    controller: controllerpassword,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                        label: Text("First Name"), hintText: "First Name"),
                    controller: controllerfirstname,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                        label: Text("Last Name"), hintText: "Last Name"),
                    controller: controllerlastname,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                        label: Text("Address"), hintText: "Address"),
                    controller: controlleraddress,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                        label: Text("Age"), hintText: "Age"),
                    controller: controllerage,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    width: double.infinity / 2,
                    height: 45,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: warnaTombol,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      onPressed: () {
                        _edit();
                      },
                      child: const Text("Edit",
                          style: TextStyle(color: warnaTulisanTombol)),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    width: double.infinity / 2,
                    height: 45,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: warnaTombol,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      onPressed: () {
                        _hapus();
                      },
                      child: const Text("Hapus",
                          style: TextStyle(color: warnaTulisanTombol)),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
