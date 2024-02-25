import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Pages/constants/constants.dart';
import 'package:food_donation_app/Router/route.dart';
import 'package:food_donation_app/constants.dart';
import 'firebase_options.dart';

void main() async {
  ErrorWidget.builder = (FlutterErrorDetails details) => Scaffold(
          body: Center(
        child: Text(
          "Something Went wrong.",
          style: TextStyle(color: Colors.grey),
        ),
      ));

  WidgetsFlutterBinding.ensureInitialized();
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
        debugShowCheckedModeBanner: false,
        routerConfig: _appRouter.config(),
        title: 'Food Donation App',
        theme: ThemeData(
            fontFamily: 'Poppins',
            primarySwatch: Colors.green,
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: black,
              selectionHandleColor: black.withOpacity(0.8),
            ),
            inputDecorationTheme: InputDecorationTheme(
                labelStyle: TextStyle(
                    color: bgColor,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
                floatingLabelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0.sp,
                    fontWeight: FontWeight.bold),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: black, width: 2.0.w),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 0.8.w,
                  ),
                )),
            primaryColor: white,
            scaffoldBackgroundColor: bgColor,
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
