import 'package:flutter/material.dart';

class Pemisah extends StatefulWidget {
  const Pemisah({Key? key}) : super(key: key);

  @override
  State<Pemisah> createState() {
    // TODO: implement createState
    return _PemisahState();
  }
}

class _PemisahState extends State<Pemisah> {
  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 0,
      thickness: 1,
      indent: 0,
      endIndent: 0,
      color: Colors.black,
    );
  }
}
