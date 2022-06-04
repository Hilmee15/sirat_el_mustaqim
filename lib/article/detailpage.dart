import 'package:flutter/material.dart';
import 'package:sirat_el_mustaqim/article/kisahnabipage.dart';
import 'package:sirat_el_mustaqim/model/kisahnabi.dart';
import 'package:sirat_el_mustaqim/utility/utils.dart';

class DetailPage extends StatefulWidget {
  final KisahNabi story;

  DetailPage({Key? key, required this.story}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
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
                      return const Kisah25NabiPage();
                    }));
          },
        ),
        title: const Text('Kisah Nabi'),
      ),
      backgroundColor: primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.network(
                    widget.story.image_url,
                    height: 250,
                    width: 420,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.story.description,
                      style: subtitle2,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
