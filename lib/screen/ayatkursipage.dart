import 'package:flutter/material.dart';
import 'package:sirat_el_mustaqim/model/ayatkursi.dart';
import 'package:sirat_el_mustaqim/screen/homepage.dart';
import 'package:sirat_el_mustaqim/service/service.dart';
import 'package:sirat_el_mustaqim/utility/utils.dart';

class AyatKursiPage extends StatelessWidget {
  const AyatKursiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      transitionDuration: const Duration(seconds: 5),
                      transitionsBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secAnimation,
                          Widget child) {
                        animation = CurvedAnimation(
                            parent: animation, curve: Curves.elasticOut);
                        return Align(
                          child: SizeTransition(
                            sizeFactor: animation,
                            child: child,
                            axisAlignment: 0.0,
                          ),
                        );
                      },
                      pageBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secAnimation) {
                        return const HomePage();
                      }));
            },
          ),
          title: const Text('Ayat Kursi'),
        ),
        body: SingleChildScrollView(
          child: FutureBuilder(
            future: Ayat.getData(),
            builder: (BuildContext context, AsyncSnapshot<AyatKursi> snapshot) {
              if (snapshot.data != null) {
                var ayatAllah = snapshot.data as AyatKursi;
                return Card(
                  color: primaryColor,
                  child: Padding(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          ayatAllah.arabic,
                          textDirection: TextDirection.rtl,
                          // softWrap: false,
                          style: arabicText,
                        ),
                        SizedBox(
                            width: 500,
                            child: Text(
                              ayatAllah.translation,
                              style: subtitle,
                            ))
                      ],
                    ),
                    padding: const EdgeInsets.all(15),
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ));
  }
}
