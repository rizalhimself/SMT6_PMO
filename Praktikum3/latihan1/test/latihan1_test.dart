import 'dart:io';

void main(List<String> arguments) {
  double jarijari, tinggi;
  String lagi;

  while (true) {
    print("Rumus Lingkaran dan Silinder");
    stdout.write("Jari - jari : ");
    jarijari = double.parse(stdin.readLineSync().toString());

    stdout.write("Tinggi : ");
    tinggi = double.parse(stdin.readLineSync().toString());

    Lingkaran lingkaran = Lingkaran(jarijari);
    print("Luas Lingkaran : " + lingkaran.luaslingkaran().toString());
    print("Keliling Lingkaran : " + lingkaran.kelilinglingkaran().toString());
    print("");

    Silinder silinder = Silinder(tinggi, jarijari);
    print("Luas satu tutup tabung : " + silinder.luaslingkaran().toString());
    print(
        "Luas permukaan tabung : " + silinder.luasPermukaanTabung().toString());
    print("Luas selimut tabung : " + silinder.luasSelimutTabung().toString());
    print("Isi tabung : " + silinder.isiTabung().toString());
    print("");

    stdout.write("Apakah anda akan mencoba lagi?");
    stdout.write("Silakan jawab T jika tidak ingin mencoba lagi : ");
    lagi = stdin.readLineSync().toString();

    if (lagi.toUpperCase() == "T") {
      break;
    }
  }
}

class Lingkaran {
  double _jarijari = 0;
  Lingkaran(this._jarijari);
  double get jarijari => _jarijari;

  set jarijari(double value) {
    _jarijari = value;
  }

  double luaslingkaran() {
    return 22 / 7 + _jarijari * _jarijari;
  }

  double kelilinglingkaran() {
    return 2 * 22 / 7 * jarijari;
  }
}

class Silinder extends Lingkaran {
  double _tinggi = 0;
  Silinder(this._tinggi, this_jarijari) : super(this_jarijari);
  double get tinggi => _tinggi;

  set tinggi(double value) {
    _tinggi = value;
  }

  double luasPermukaanTabung() {
    return 2 * luaslingkaran() + kelilinglingkaran() * tinggi;
  }

  double luasSelimutTabung() {
    return kelilinglingkaran() * tinggi;
  }

  double isiTabung() {
    return luaslingkaran() * tinggi;
  }
}
