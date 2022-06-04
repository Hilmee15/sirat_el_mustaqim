import 'package:flutter/material.dart';
import 'package:sirat_el_mustaqim/article/detailpage.dart';
import 'package:sirat_el_mustaqim/model/kisahnabi.dart';
import 'package:sirat_el_mustaqim/screen/homepage.dart';
import 'package:sirat_el_mustaqim/service/service.dart';
import 'package:sirat_el_mustaqim/utility/utils.dart';

class Kisah25NabiPage extends StatelessWidget {
  const Kisah25NabiPage({Key? key}) : super(key: key);

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
        title: const Text('Kisah Nabi'),
      ),
      body: FutureBuilder(
        future: Kisah.getData(),
        builder: (context, AsyncSnapshot<List<KisahNabi>> snapshot) {
          if (snapshot.data != null) {
            var kisahList = snapshot.data!;
            return ListView.builder(
                itemCount: kisahList.length,
                itemBuilder: (context, index) {
                  var story = kisahList[index];
                  return GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        PageRouteBuilder(
                            transitionDuration: const Duration(seconds: 5),
                            transitionsBuilder: (BuildContext context,
                                Animation<double> animation,
                                Animation<double> secAnimation,
                                Widget child) {
                              animation = CurvedAnimation(
                                  parent: animation, curve: Curves.elasticOut);
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                            pageBuilder: (BuildContext context,
                                Animation<double> animation,
                                Animation<double> secAnimation) {
                              return DetailPage(story: story);
                            })),
                    child: Card(
                      elevation: 5,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: Image.network(
                              story.image_url,
                              height: 100,
                              width: 180,
                              fit: BoxFit.cover,
                              errorBuilder: (context, obj, e) {
                                return Container(
                                  height: 100,
                                  width: 100,
                                  color: primaryColor,
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              story.name,
                              softWrap: true,
                              style: titleText2.copyWith(fontSize: 24),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
