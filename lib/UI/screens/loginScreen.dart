import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manipalsocial/UI/widgets/alertDialog.dart';
import 'package:manipalsocial/UI/widgets/customTextField.dart';
import 'package:manipalsocial/UI/widgets/pinkButton.dart';
import 'package:manipalsocial/logic/viewModels/userViewModel.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff131132),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Center(
              child: Container(
                width: double.infinity,
                child: Center(
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text("Login",
                            style: TextStyle(
                                color: Color(0xffFC2E7E), fontSize: 50.0)),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Enter your details to Login",
                          style: TextStyle(fontSize: 17.0, color: Colors.white),
                        )
                      ]),
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  CustomTextField(
                      hintMessage: 'Email',
                      controller: emailController,
                      isPassword: false),
                  CustomTextField(
                      hintMessage: 'Password',
                      controller: passwordController,
                      isPassword: true),
                  SizedBox(
                    height: 20.0,
                  ),
                  Provider.of<UserViewModel>(context).isFetchingData == true
                      ? CircularProgressIndicator()
                      : PinkButton(
                          buttonText: 'Login',
                          onPress: () async {
                            bool success = await Provider.of<UserViewModel>(
                                    context,
                                    listen: false)
                                .login(emailController.text,
                                    passwordController.text);
                            if (success == true) {
                              Navigator.pushReplacementNamed(context, '/home');
                            } else {
                              showMyDialog(
                                  context,
                                  'Oops!',
                                  'Looks like something went wrong.',
                                  Provider.of<UserViewModel>(context,
                                          listen: false)
                                      .errorMessage);
                            }
                          },
                        ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?  ",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/signUp');
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Color(0xffFC2E7E),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
