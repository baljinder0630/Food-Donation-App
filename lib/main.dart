import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Router/route.dart';
import 'package:food_donation_app/constants.dart';

// import 'package:flutter_stripe/flutter_stripe.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Stripe.publishableKey =
  //     "pk_test_51ORuApSJmtO3RawjC53EVLBpPpuIUb0tuwdTFGfBZNssqHsSnrZeQ3YmxS439VNmGsspLBWB3BjyJZe8sws7df1L00SjSckuJM";
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(ProviderScope(child: MyApp())));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
    );
    return MaterialApp.router(
        routerConfig: _appRouter.config(),
        title: 'Food Donation App',
        theme: ThemeData(
            fontFamily: 'Poppins',
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
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
                color: Colors.transparent,
                elevation: 0,
                iconTheme: IconThemeData(color: Colors.black)),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ButtonStyle(
                    textStyle: MaterialStateProperty.all<TextStyle>(
                      const TextStyle(
                          fontFamily: 'Poppins',
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
