import 'package:flutter/material.dart';
import 'package:sirat_el_mustaqim/model/doaharian.dart';
import 'package:sirat_el_mustaqim/screen/homepage.dart';
import 'package:sirat_el_mustaqim/service/service.dart';
import 'package:sirat_el_mustaqim/utility/utils.dart';

class DoaHarianPage extends StatelessWidget {
  const DoaHarianPage({Key? key}) : super(key: key);

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
          title: const Text('Doa Harian'),
        ),
        body: FutureBuilder(
          future: Dua.getData(),
          builder: (BuildContext context, AsyncSnapshot<List<Doa>> snapshot) {
            if (snapshot.data != null) {
              var doaSehariHari = snapshot.data as List<Doa>;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    color: primaryColor,
                    child: Padding(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 300,
                            child: Text(
                              doaSehariHari[index].title,
                              style: titleText,
                            ),
                          ),
                          Text(
                            doaSehariHari[index].arabic,
                            textAlign: TextAlign.end,
                            // softWrap: false,
                            style: duaTextStyle,
                          ),
                          SizedBox(
                              width: 500,
                              child: Text(
                                doaSehariHari[index].translation,
                                style: subtitle,
                              ))
                        ],
                      ),
                      padding: const EdgeInsets.all(15),
                    ),
                  );
                },
                itemCount: doaSehariHari.length,
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
