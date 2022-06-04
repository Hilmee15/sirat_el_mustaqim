import 'package:flutter/material.dart';
import 'package:sirat_el_mustaqim/model/asmaulhusna.dart';
import 'package:sirat_el_mustaqim/screen/homepage.dart';
import 'package:sirat_el_mustaqim/service/service.dart';
import 'package:sirat_el_mustaqim/utility/utils.dart';

class AsmaulHusnaPage extends StatelessWidget {
  const AsmaulHusnaPage({Key? key}) : super(key: key);

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
          title: const Text('Asmaul Husna'),
        ),
        body: FutureBuilder(
          future: AsmaAllah.getData(),
          builder: (BuildContext context,
              AsyncSnapshot<List<AsmaulHusna>> snapshot) {
            if (snapshot.data != null) {
              var asmaAllah = snapshot.data as List<AsmaulHusna>;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    color: primaryColor,
                    child: Padding(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                asmaAllah[index].latin,
                                style: titleText,
                              ),
                              SizedBox(
                                width: 100,
                                child: Text(
                                  asmaAllah[index].arabic,
                                  softWrap: false,
                                  style: arabicText,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                              width: 250,
                              child: Text(
                                asmaAllah[index].translation_id,
                                style: subtitle,
                              ))
                        ],
                      ),
                      padding: const EdgeInsets.all(15),
                    ),
                  );
                },
                itemCount: asmaAllah.length,
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
