import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double angkaTampungan1 = 0;
  double angkaTampungan2 = 0;
  String tekshasil = '0';
  bool hapusLayar = false;
  String operasi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Kalkulator"),
        ),
        body: Container(
          margin: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              kalkulator(),
              ClipOval(
                child: Image.asset(
                  'gresik.jpg',
                  width: 200,
                  height: 200,
                ),
              )
            ],
          ),
        ));
  }

  kalkulator() {
    return Container(
      height: MediaQuery.of(context).size.width + 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          hasil(),
          baris1(),
          baris2(),
          baris3(),
          baris4(),
          baris5()
        ],
      ),
    );
  }

  baris1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        tombol("MC", Colors.green[300]),
        tombol("MR", Colors.green[300]),
        tombol("M+", Colors.green[300]),
        tombol("M-", Colors.green[300]),
        tombol("CE", Colors.red[300]),
      ],
    );
  }

  baris2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        tombol("7", Colors.blue[100]),
        tombol("8", Colors.blue[100]),
        tombol("9", Colors.blue[100]),
        tombol(":", Colors.green[300]),
        tombol("^", Colors.green[300]),
      ],
    );
  }

  baris3() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        tombol("4", Colors.blue[100]),
        tombol("5", Colors.blue[100]),
        tombol("6", Colors.blue[100]),
        tombol("x", Colors.green[300]),
        tombol("%", Colors.green[300]),
      ],
    );
  }

  baris4() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        tombol("1", Colors.blue[100]),
        tombol("2", Colors.blue[100]),
        tombol("3", Colors.blue[100]),
        tombol("-", Colors.green[300]),
        tombol("1/x", Colors.green[300]),
      ],
    );
  }

  baris5() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        tombol("0", Colors.blue[100]),
        tombol(".", Colors.blue[100]),
        tombol("+/-", Colors.blue[100]),
        tombol("+", Colors.green[300]),
        tombol("=", Colors.green[300]),
      ],
    );
  }

  apakahNomerYangDiTekan(String input) {
    if (input == "0") {
      return true;
    }
    if (input == '1') {
      return true;
    }
    if (input == '2') {
      return true;
    }
    if (input == '3') {
      return true;
    }
    if (input == '4') {
      return true;
    }
    if (input == '5') {
      return true;
    }
    if (input == '6') {
      return true;
    }
    if (input == '7') {
      return true;
    }
    if (input == '8') {
      return true;
    }
    if (input == '9') {
      return true;
    }
    return false;
  }

  tombol(String title, Color warna) {
    return Container(
        width: MediaQuery.of(context).size.width / 5 - 8,
        height: MediaQuery.of(context).size.width / 5 - 8,
        child: OutlineButton(
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(8.0),
          ),
          color: warna,
          onPressed: () {
            tekanTombol(title);
          },
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                  color: warna, fontWeight: FontWeight.bold, fontSize: 25.0),
            ),
          ),
        ));
  }

  tekanTombol(tombol) {
    setState(() {
      if (apakahNomerYangDiTekan(tombol)) {
        if (hapusLayar) {
          tekshasil = '0';
          hapusLayar = false;
        }
        if (tekshasil.length < 11) {
          if (tekshasil == '0') {
            tekshasil = tombol;
          } else {
            tekshasil += tombol;
          }
        }
      } else if (tombol == 'M+') {
        hapusLayar = false;
      } else if (tombol == 'CE') {
        hapusLayar = false;
        hapusBelakang();
      } else if (tombol == 'MR') {
        hapusLayar = false;
      } else if (tombol == 'MC') {
        hapusLayar = false;
        kosongkanLayar();
      } else if (tombol == ':') {
        setOperasi(tombol);
      } else if (tombol == 'x') {
        setOperasi(tombol);
      } else if (tombol == '-') {
        setOperasi(tombol);
      } else if (tombol == '+') {
        setOperasi(tombol);
      } else if (tombol == '^') {
        setOperasi(tombol);
      } else if (tombol == '%') {
        setOperasi(tombol);
      } else if (tombol == '1/x') {
        setOperasi(tombol);
      } else if (tombol == '=') {
        hapusLayar = true;
        angkaTampungan2 = double.parse(tekshasil);
        hitungHasil();
      }
    });
  }

  kosongkanLayar() {
    tekshasil = '0';
  }

  setOperasi(tombol) {
    hapusLayar = true;
    operasi = tombol;
    angkaTampungan1 = double.parse(tekshasil);
  }

  hitungHasil() {
    switch (operasi) {
      case ':':
        tekshasil = "${angkaTampungan1 / angkaTampungan2}";
        break;
      case 'x':
        tekshasil = "${angkaTampungan1 * angkaTampungan2}";
        break;
      case '-':
        tekshasil = "${angkaTampungan1 - angkaTampungan2}";
        break;
      case '+':
        tekshasil = "${angkaTampungan1 + angkaTampungan2}";
        break;
      case '^':
        tekshasil = "${angkaTampungan1 * angkaTampungan1}";
        break;
      case '%':
        tekshasil = "${angkaTampungan1 * (angkaTampungan2 / 100)}";
        break;
      case '1/x':
        tekshasil = "${1 / angkaTampungan1}";
        break;
    }
    print("$angkaTampungan1 $operasi $angkaTampungan2 = $tekshasil");
    angkaTampungan1 = 0;
    angkaTampungan2 = 0;
  }

  hapusBelakang() {
    if (tekshasil.length > 1)
      tekshasil = tekshasil.substring(0, tekshasil.length - 1);
    else
      tekshasil = '0';
  }

  hasil() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100.0,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "$tekshasil",
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
