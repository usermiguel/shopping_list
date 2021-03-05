import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list/MainScreens/homeScreen.dart';
import 'package:shopping_list/MainScreens/login/loginScreen.dart';
import 'package:shopping_list/MainScreens/login/welcomeScreen.dart';
import 'package:shopping_list/Utils/AssetsImages.dart';
import 'package:shopping_list/Utils/ConstantsApp.dart';
import 'package:shopping_list/Utils/TextApp.dart';
import 'package:shopping_list/Widgets/Design/DesignWidgets.dart';
import 'package:splashscreen/splashscreen.dart';
import 'dart:developer' as developer;

import 'Utils/LoginGoogleUtils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xffff7043),
        primaryColorLight: Color(0xffffa270),
        accentColor: Color(0xff212121),
        // backgroundColor: Color(0xff484848),
        primaryColorDark: Color(0xffc63f17),

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //init

  final Future<FirebaseApp> _initializationFirebase = Firebase.initializeApp();
  static const String TAG = "Main";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
          future: _initializationFirebase,
          builder: (context, snapshot) {
            //checkforerrors
            if (snapshot.hasError) {
              developer.log(TAG + ", Firebase init. ERROR");
              return SnackBar(content: Text("Error inicializando Firebase"));
            } else if (snapshot.connectionState == ConnectionState.done) {
              developer.log(TAG + ", Firebase init. DONE");
              LoginGoogleUtils().googleSignIn.isSignedIn().then((value) {
                if (value != null) {
                  if (value) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) {
                          return HomeScreen();
                        },
                      ),
                    );
                  } else {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginScreen();
                        },
                      ),
                    );
                  }
                } else {
                  log("loginScreen build()ERROR user viene nulo");
                }
              });

              //done
              return SplashScreen(
                seconds: ConstanstApp.TIME_SPLASH_SCREEN,
                navigateAfterSeconds: WelcomeScreen(),
                image: AssetsImages.ImageLogo(),
                backgroundColor: Colors.white,
                photoSize: 100,
                loadingText: Text(
                  TextApp.LOADING,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                loaderColor: Theme.of(context).primaryColor,
                gradientBackground: DesignWidgets.linearGradientMain(context),
              );
            }
            return CircularProgressIndicator();
          }),
    );
  }
}
