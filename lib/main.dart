import 'package:flutter/material.dart';
import 'package:shopping_list/MainScreens/homeScreen.dart';
import 'package:shopping_list/MainScreens/login/welcomeScreen.dart';
import 'package:shopping_list/Utils/AssetsImages.dart';
import 'package:shopping_list/Utils/ConstantsApp.dart';
import 'package:shopping_list/Utils/TextApp.dart';
import 'package:shopping_list/Widgets/Design/DesignWidgets.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  @override
  Widget build(BuildContext context) {
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
}
