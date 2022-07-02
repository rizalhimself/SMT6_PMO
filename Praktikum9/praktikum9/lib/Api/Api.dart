import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constant/Bantuan.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CallApi {
  Future postData(data, apiUrl, BuildContext context) async {
    try {
      http.Response hasilRespons =
          await http.post(Uri.parse(BaseUrl + apiUrl), body: data);
      print(hasilRespons.statusCode);
      print(hasilRespons.body);
      if (hasilRespons.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Simpan data berhasil")));
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future putData(data, apiUrl, BuildContext context) async {
    try {
      http.Response hasilRespons =
          await http.put(Uri.parse(BaseUrl + apiUrl), body: data);
      print(hasilRespons.statusCode);
      print(hasilRespons.body);
      if (hasilRespons.statusCode == 200) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Edit data berhasil")));
        return true;
      } else if (hasilRespons.statusCode == 201) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Hapus data berhasil")));
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future delData(data, apiUrl, BuildContext context) async {
    try {
      http.Response hasilRespons =
          await http.delete(Uri.parse(BaseUrl + apiUrl), body: data);
      print(hasilRespons.statusCode);
      print(hasilRespons.body);
      if (hasilRespons.statusCode == 201) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Hapus data berhasil")));
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
}
