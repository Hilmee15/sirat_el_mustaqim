import 'package:flutter/material.dart';
import 'package:sirat_el_mustaqim/screen/homepage.dart';
import 'package:sirat_el_mustaqim/utility/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sirat-El-Mustaqim',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: primaryColor),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sirat-El-Mustaqim",
              style: greetingText2,
            ),
            TextButton(
              child: Text(
                'ابتدائي',
                style: arabicText2,
              ),
              style: TextButton.styleFrom(
                padding:
                    const EdgeInsets.only(left: 50, right: 50, top: 15, bottom: 15),
                primary: primaryColor,
                backgroundColor: Colors.white,
                onSurface: Colors.white,
              ),
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
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                        pageBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secAnimation) {
                          return const HomePage();
                        }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
