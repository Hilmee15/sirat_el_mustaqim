import 'package:flutter/material.dart';
import 'package:sirat_el_mustaqim/model/bacaanshalat.dart';
import 'package:sirat_el_mustaqim/screen/homepage.dart';
import 'package:sirat_el_mustaqim/service/service.dart';
import 'package:sirat_el_mustaqim/utility/utils.dart';

class BacaanShalatPage extends StatelessWidget {
  const BacaanShalatPage({Key? key}) : super(key: key);

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
          title: const Text('Bacaan Shalat'),
        ),
        body: FutureBuilder(
          future: BacaanDalamShalat.getData(),
          builder: (BuildContext context,
              AsyncSnapshot<List<BacaanShalat>> snapshot) {
            if (snapshot.data != null) {
              var panduanShalat = snapshot.data as List<BacaanShalat>;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    color: primaryColor,
                    child: Padding(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            panduanShalat[index].name,
                            style: titleText,
                          ),
                          Text(
                            panduanShalat[index].arabic,
                            textAlign: TextAlign.end,
                            // softWrap: false,
                            style: arabicText,
                          ),
                          SizedBox(
                              width: 500,
                              child: Text(
                                panduanShalat[index].terjemahan,
                                style: subtitle,
                              ))
                        ],
                      ),
                      padding: const EdgeInsets.all(15),
                    ),
                  );
                },
                itemCount: panduanShalat.length,
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
