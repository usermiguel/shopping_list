import 'package:flutter/material.dart';
import 'package:shopping_list/MainScreens/login/loginScreen.dart';
import 'package:shopping_list/MainScreens/login/signUp.dart';
import 'package:shopping_list/Utils/TextApp.dart';
import 'package:shopping_list/Widgets/Components/Buttons/myLoginButton.dart';
import 'package:shopping_list/Widgets/Design/DesignWidgets.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: DesignWidgets.linearGradientMain(context),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DesignWidgets.titleCustom(),
                MyLoginButton(
                  text: TextApp.LOGIN,
                  colorText: Theme.of(context).primaryColor,
                  colorButtonBackground: Colors.white,
                  widgetToNavigate: LoginScreen(),
                ),
                _singUpButton(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  _singUpButton(BuildContext context) {
    return Container(
      width: double.infinity,
      child: OutlineButton(
        borderSide: BorderSide(color: Colors.white),
        highlightedBorderColor: Theme.of(context).primaryColorLight,
        padding: EdgeInsets.all(15.00),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.00),
        ),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUp())),
        child: Text(
          TextApp.SINGUP,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
