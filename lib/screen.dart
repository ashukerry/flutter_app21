import 'package:flutter/material.dart';
import 'package:flutter_app21/phone_number.dart';
import 'package:flutter_app21/textformfield.dart';

import 'customShape/customShape.dart';
import 'intl_phone_field.dart';
import 'dart:core';
import 'package:email_validator/email_validator.dart';

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  String email = "";
  String username = "";

  String errorText = "";
  bool isValidEmail = false;

  GlobalKey<FormState> _formKey = GlobalKey();
  Widget logoBackground() {
    return Container(
      color: Colors.white,
      child: Container(
          color: Colors.transparent,
          child: Stack(
            children: <Widget>[
              CustomPaint(
                size: Size(800, 260),
                painter: RPSCustomPainter(),
              ),
              Positioned(
                  right: 1,
                  child: Image.asset("assets/background.png", height: 190)),
              Positioned(
                  right: 10,
                  left: 10,
                  top: 10,
                  bottom: 70,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.4,
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Image.asset("assets/ejaraLogoWhite.png"),
                        SizedBox(
                          height: 20,
                        ),
                        Text("Create an Account",
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                fontStyle: FontStyle.normal,
                                color: Colors.white)),
                      ],
                    ),
                  )),
            ],
          )),
    );
  }

  Widget inputField() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 30),
                TextFormField(
                  validator: (value) =>
                      value == null ? "enter user name" : null,
                  decoration: inputDecoration("Username"),
                  onChanged: (value) {
                    setState(() {
                      username = value;
                    });
                    print(email);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) =>
                      value == null ? "enter user email" : null,
                  decoration: inputDecoration("email"),
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                    print(email);
                  },
                ),
                SizedBox(
                  height: 3,
                ),
                Center(
                    child: Text("$errorText",
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.red))),

                SizedBox(
                  height: 10,
                ),
                IntlPhoneField(
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                  ),
                  onChanged: (phone) {
                    setState(() {
                      PhoneNumber phonenumber = phone;
                    });

                    print(phone.completeNumber);
                  },
                  onCountryChanged: (phone) {
                    print('Country code changed to: ' + "$phone.countryCode");
                  },
                ),
                SizedBox(
                  height: 2,
                ),
                // MaterialButton(
                //   child: Text('Submit'),
                //   color: Theme.of(context).primaryColor,
                //   textColor: Colors.white,
                //   onPressed: () {
                //     _formKey.currentState.validate();
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget inputButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isValidEmail = EmailValidator.validate(email);
        });
        if (isValidEmail == true) {
          setState(() {
            errorText = "put in correct email";
          });
        } else {
          setState(() {
            errorText = "";
          });
        }
      },
      child: Container(
        height: 50,
        width: 280,
        child: Center(
            child: Text(
          "next",
          style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.white,
              fontSize: 20),
        )),
        decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.blue.shade900,
            shape: BoxShape.rectangle),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  logoBackground(),
                  inputField(),
                  inputButton(),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
