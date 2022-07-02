import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:praktikum9/Api/Api.dart';
import 'package:praktikum9/Constant/ConstantColor.dart';
import 'package:praktikum9/Constant/Ukuran.dart';

class UserAdd extends StatefulWidget {
  const UserAdd({Key? key}) : super(key: key);

  @override
  State<UserAdd> createState() {
    // TODO: implement createState
    return _UserAddState();
  }
}

class _UserAddState extends State<UserAdd> {
  TextEditingController controllerusername = TextEditingController();
  TextEditingController controllerpassword = TextEditingController();
  TextEditingController controllerfirstname = TextEditingController();
  TextEditingController controllerlastname = TextEditingController();
  TextEditingController controlleraddress = TextEditingController();
  TextEditingController controllerage = TextEditingController();

  _simpan() async {
    var data = {
      'username': controllerusername.text,
      'password': controllerpassword.text,
      'firstname': controllerfirstname.text,
      'lastname': controllerlastname.text,
      'address': controlleraddress.text,
      'age': controllerage.text,
    };
    bool res = await CallApi().postData(data, 'users', context);
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
            Text('Tambah Users', style: TextStyle(fontSize: ukurnHurufSubJudul))
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
                  width: double.infinity,
                  height: 45,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: warnaTombol,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    onPressed: () {
                      _simpan();
                    },
                    child: const Text("Simpan",
                        style: TextStyle(color: warnaTulisanTombol)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
