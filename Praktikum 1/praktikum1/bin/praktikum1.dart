import 'dart:io';

void main() {
  String caraBeli, pilihan = '0';
  int jmlBarang, hargaBarang, totalHarga, totalBayar, diskon, jumlah = 0;
  List arrTotal = [];
  List arrBarang = [
    ['Laptop', 2000000],
    ['Mouse', 50000],
    ['Printer', 500000]
  ];

  void masukkanKedalamArray() {
    if (pilihan == 'sudah') {
    } else {
      arrTotal.add(arrBarang.elementAt(int.parse(pilihan) - 1));
    }
  }

  void hitungTotalBelanja() {
    int a = 0;
    for (int i = 0; i < arrTotal.length; i++) {
      a = (arrTotal[i][1]);
      jumlah = jumlah + a;
    }
  }

  void keranjang() {
    print('===================');
    print(' Keranjang Barang  ');
    print('===================');
    print('No.\tNama Barang\tHarga ');
    for (int i = 0; i < arrTotal.length; i++) {
      print((i + 1).toString() +
          '\t' +
          arrTotal[i][0] +
          '\t\tRp ' +
          (arrTotal[i][1]).toString());
    }
    hitungTotalBelanja();
    print('Total belanja anda adalah Rp ' +
        jumlah.toString() /*Disini total belanja*/);
  }

  void pilihBarang() {
    print('===================');
    print('    List Barang    ');
    print('===================');
    print('No.\tNama Barang\tHarga ');
    for (int i = 0; i < arrBarang.length; i++) {
      print((i + 1).toString() +
          '\t' +
          arrBarang[i][0] +
          '\t\tRp ' +
          (arrBarang[i][1]).toString());
    }
    do {
      print(
          'Silahkan masukkan pilihan anda?(ketik sudah untuk mengakhiri pilihan)');
      pilihan = stdin.readLineSync().toString();
      masukkanKedalamArray();
    } while (pilihan != 'sudah');
    keranjang();
  }

  print('===================');
  print('=    Toko Rizal   =');
  print('=    19SA1116     =');
  print('===================');
  print('\n');
  print('Apakah anda akan masuk?(y/n)');
  var masuk = stdin.readLineSync();
  print(masuk);
  if (masuk == 'y') {
    pilihBarang();
  }
}
