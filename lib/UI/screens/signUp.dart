import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manipalsocial/UI/widgets/alertDialog.dart';
import 'package:manipalsocial/UI/widgets/customTextField.dart';
import 'package:manipalsocial/UI/widgets/pinkButton.dart';
import 'package:manipalsocial/logic/viewModels/userViewModel.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
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
            Expanded(
                child: Center(
              child: Container(
                width: double.infinity,
                child: Center(
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text("Sign up",
                            style: TextStyle(
                                color: Color(0xffFC2E7E), fontSize: 50.0)),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Enter your details to create account",
                          style: TextStyle(fontSize: 17.0, color: Colors.white),
                        )
                      ]),
                ),
              ),
            )),
            Expanded(
              flex: 2,
              child: Container(
                child: ListView(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        CustomTextField(
                            hintMessage: 'Enter Full Name',
                            controller: nameController,
                            isPassword: false),
                        CustomTextField(
                            hintMessage: 'Enter Email',
                            controller: emailController,
                            isPassword: false),
                        CustomTextField(
                            hintMessage: 'Enter Phone Number',
                            controller: phoneController,
                            isPassword: false),
                        CustomTextField(
                            hintMessage: 'Password',
                            controller: passwordController,
                            isPassword: true),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: Container(
                    child: Column(
              children: <Widget>[
                Provider.of<UserViewModel>(context).isFetchingData == true
                    ? CircularProgressIndicator()
                    : PinkButton(
                        buttonText: 'Register',
                        onPress: () async {
                          //Calling signup method of userViewModel
                          bool success = await Provider.of<UserViewModel>(
                                  context,
                                  listen: false)
                              .signUp(
                                  nameController.text,
                                  emailController.text,
                                  phoneController.text,
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
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?  ",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Color(0xffFC2E7E),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            )))
          ],
        ),
      ),
    );
  }
}
