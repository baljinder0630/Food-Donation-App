import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_donation_app/Router/route.dart';
import 'package:food_donation_app/constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        routerConfig: _appRouter.config(),
        title: 'Food Donation App',
        theme: ThemeData(
            fontFamily: 'Georgia',
            primarySwatch: Colors.teal,
            inputDecorationTheme: const InputDecorationTheme(
                labelStyle: TextStyle(
                    color: Color.fromARGB(255, 119, 119, 119),
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
                floatingLabelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: primaryColor, width: 2.0),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.8),
                )),
            primaryColor: primaryColor,
            scaffoldBackgroundColor: backgroundColor,
            appBarTheme: const AppBarTheme(
                color: Colors.transparent,
                elevation: 0,
                iconTheme: IconThemeData(color: Colors.black)),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ButtonStyle(
                    textStyle: MaterialStateProperty.all<TextStyle>(
                      const TextStyle(
                          fontFamily: 'Georgia',
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(buttonColor)))));
  }
}
