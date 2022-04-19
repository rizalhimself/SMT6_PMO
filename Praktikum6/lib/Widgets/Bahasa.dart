import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

bool chkIndonesia = false,
    chkInggris = false,
    chkArab = false,
    chkSunda = false,
    chkJawa = false,
    chkMadura = false,
    chkMandarin = false,
    chkJepang = false,
    chkKorea = false;

class Bahasa extends StatefulWidget {
  const Bahasa({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BahasaState();
}

class _BahasaState extends State<Bahasa> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Kemampuan Berbahasa"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    value: chkIndonesia,
                    onChanged: (bool? value) {
                      setState(() {
                        chkIndonesia = value!;
                      });
                    },
                  ),
                  const Text("Indonesia"),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    value: chkInggris,
                    onChanged: (bool? value) {
                      setState(() {
                        chkInggris = value!;
                      });
                    },
                  ),
                  const Text("Inggris")
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Checkbox(
                    value: chkArab,
                    onChanged: (bool? value) {
                      setState(() {
                        chkArab = value!;
                      });
                    },
                  ),
                  const Text("Arab")
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Checkbox(
                    value: chkJawa,
                    onChanged: (bool? value) {
                      setState(() {
                        chkJawa = value!;
                      });
                    },
                  ),
                  const Text("Jawa")
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Checkbox(
                    value: chkJepang,
                    onChanged: (bool? value) {
                      setState(() {
                        chkJepang = value!;
                      });
                    },
                  ),
                  const Text("Jepang")
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Checkbox(
                    value: chkKorea,
                    onChanged: (bool? value) {
                      setState(() {
                        chkKorea = value!;
                      });
                    },
                  ),
                  const Text("Korea")
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Checkbox(
                    value: chkMadura,
                    onChanged: (bool? value) {
                      setState(() {
                        chkKorea = value!;
                      });
                    },
                  ),
                  const Text("Madura")
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Checkbox(
                    value: chkMandarin,
                    onChanged: (bool? value) {
                      setState(() {
                        chkMandarin = value!;
                      });
                    },
                  ),
                  const Text("Mandarin")
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Checkbox(
                    value: chkSunda,
                    onChanged: (bool? value) {
                      setState(() {
                        chkSunda = value!;
                      });
                    },
                  ),
                  const Text("Sunda")
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

String cariBahasa() {
  String _bahasa = "";

  if (chkIndonesia) {
    _bahasa += "Indonesia,";
  }
  if (chkArab) {
    _bahasa += "Arab,";
  }
  if (chkInggris) {
    _bahasa += "Inggris,";
  }
  if (chkJawa) {
    _bahasa += "Jawa,";
  }
  if (chkJepang) {
    _bahasa += "Jepang,";
  }
  if (chkKorea) {
    _bahasa += "Korea,";
  }
  if (chkMadura) {
    _bahasa += "Madura,";
  }
  if (chkMandarin) {
    _bahasa += "Mandarin,";
  }
  if (chkSunda) {
    _bahasa += "Sunda,";
  }
  if (_bahasa.length > 0) {
    _bahasa = _bahasa.substring(0, _bahasa.length - 1);
  }

  return _bahasa;
}
