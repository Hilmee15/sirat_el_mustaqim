import 'package:flutter/material.dart';
import 'package:sirat_el_mustaqim/article/kisahnabipage.dart';
import 'package:sirat_el_mustaqim/screen/asmaulhusnapage.dart';
import 'package:sirat_el_mustaqim/screen/ayatkursipage.dart';
import 'package:sirat_el_mustaqim/screen/bacaanshalatpage.dart';
import 'package:sirat_el_mustaqim/screen/doaharianpage.dart';
import 'package:sirat_el_mustaqim/screen/niatshalatpage.dart';
import 'package:sirat_el_mustaqim/utility/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> title = [
    'Asmaul Husna',
    'Doa Harian',
    'Ayat Kursi',
    'Niat Shalat',
    'Bacaan Shalat',
    'Kisah 25 Nabi'
  ];
  List<String> images = [
    "images/asmaul_husna.jpg",
    "images/doa_harian.jpg",
    "images/quran.jpg",
    "images/shalat.jpg",
    "images/sholat.jpeg",
    "images/kisah-25-nabi.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.menu),
          title: const Text("Sirat-El-Mustaqim"),
        ),
        body: Align(
          alignment: Alignment.center,
          child: ListView.builder(
            itemBuilder: (BuildContext context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    switch (title[index]) {
                      case "Asmaul Husna":
                        return const AsmaulHusnaPage();
                      case "Doa Harian":
                        return const DoaHarianPage();
                      case "Ayat Kursi":
                        return const AyatKursiPage();
                      case "Niat Shalat":
                        return const NiatShalatPage();
                      case "Bacaan Shalat":
                        return const BacaanShalatPage();
                      case "Kisah 25 Nabi":
                        return const Kisah25NabiPage();
                      default:
                        return const AsmaulHusnaPage();
                    }
                  }));
                },
                child: Card(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.6), BlendMode.srcOver),
                        image: AssetImage(images[index]),
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.center,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        title[index],
                        textAlign: TextAlign.center,
                        style: titleText,
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: images.length,
            shrinkWrap: true,
            padding: const EdgeInsets.all(5),
            scrollDirection: Axis.vertical,
          ),
        ));
  }
}
