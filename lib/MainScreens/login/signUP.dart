import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_list/MainScreens/login/loginScreen.dart';
import 'package:shopping_list/Utils/TextApp.dart';
import 'package:shopping_list/Widgets/Components/Buttons/myBackButton.dart';
import 'package:shopping_list/Widgets/Components/Buttons/myLoginButton.dart';
import 'package:shopping_list/Widgets/Components/Buttons/mySignUpLabelButton.dart';
import 'package:shopping_list/Widgets/Components/Containers/ContainerShape01.dart';
import 'package:shopping_list/Widgets/Components/Fields/myFieldForm.dart';
import 'package:shopping_list/Widgets/Design/DesignWidgets.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Widget _emailPasswordWidget() {
    return Column(
      children: [
        MyFieldForm(title: TextApp.USER_NAME),
        MyFieldForm(
          title: TextApp.EMAIL_ID,
        ),
        MyFieldForm(title: TextApp.PASSWORD, isPassword: true),
      ],
    );
  }

  Widget _singUpLabel() {
    return FlatButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignUp()),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            TextApp.I_HAVE_ACCOUNT,
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              TextApp.LOGIN,
              style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            ContainerShape01(),
            Container(
              height: double.infinity,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: height * .15),
                      child: DesignWidgets.titleCustomDark(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height * .05),
                      child: _emailPasswordWidget(),
                    ),
                    MyLoginButton(
                        text: TextApp.SINGUP,
                        colorText: Colors.white,
                        colorButtonBackground: Theme.of(context).primaryColor,
                        widgetToNavigate: LoginScreen()),
                    MySingUpLabelButton(
                      firstText: TextApp.I_HAVE_ACCOUNT,
                      secondText: TextApp.LOGIN,
                      secondTextColor: Theme.of(context).primaryColorDark,
                      widgetToNavigate: LoginScreen(),
                    )
                  ],
                ),
              ),
            ),
            Positioned(top: height * .025, child: MyBackButton()),
          ],
        ),
      ),
    );
  }
}
