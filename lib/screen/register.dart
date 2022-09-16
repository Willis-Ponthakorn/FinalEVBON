import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/screen/home.dart';
import 'package:my_flutter/screen/login.dart';
import 'package:my_flutter/screen/maphome.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:snippet_coder_utils/list_helper.dart';
import 'package:snippet_coder_utils/multi_images_utils.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  String testText = "";
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return HomeScreen();
              }));
            },
            icon: Icon(Icons.arrow_back_ios_new)),
        title: Text('Register'),
        backgroundColor: Colors.black,
      ),
      body: Column(children: [
        SizedBox(
          height: 24,
        ),
        SizedBox(
          height: 50,
          child: FormHelper.inputFieldWidget(
            context,
            "firstname",
            "First Name",
            (onValidateVal) {
              if (onValidateVal.isEmpty) {
                return 'Host URL can\'t be empty.';
              }

              return null;
            },
            (onSavedVal) => {
              this.testText = onSavedVal,
            },
            initialValue: this.testText,
            obscureText: false,
            borderFocusColor: Colors.black,
            prefixIconColor: Theme.of(context).primaryColor,
            borderColor: Colors.black.withOpacity(0.2),
            borderRadius: 8,
            borderWidth: 1,
            focusedBorderWidth: 1,
            hintColor: Colors.black.withOpacity(0.2),
            fontSize: 14,
            hintFontSize: 14,
            paddingLeft: 35,
            paddingRight: 35,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        SizedBox(
          height: 50,
          child: FormHelper.inputFieldWidget(
            context,
            "lastname",
            "Last Name",
            (onValidateVal) {
              if (onValidateVal.isEmpty) {
                return 'Host URL can\'t be empty.';
              }

              return null;
            },
            (onSavedVal) => {
              this.testText = onSavedVal,
            },
            initialValue: this.testText,
            obscureText: false,
            borderFocusColor: Colors.black,
            prefixIconColor: Theme.of(context).primaryColor,
            borderColor: Colors.black.withOpacity(0.2),
            borderRadius: 8,
            borderWidth: 1,
            focusedBorderWidth: 1,
            hintColor: Colors.black.withOpacity(0.2),
            fontSize: 14,
            hintFontSize: 14,
            paddingLeft: 35,
            paddingRight: 35,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        SizedBox(
          height: 50,
          child: FormHelper.inputFieldWidget(
            context,
            "email",
            "Email",
            (onValidateVal) {
              if (onValidateVal.isEmpty) {
                return 'Host URL can\'t be empty.';
              }

              return null;
            },
            (onSavedVal) => {
              this.testText = onSavedVal,
            },
            initialValue: this.testText,
            obscureText: false,
            borderFocusColor: Colors.black,
            prefixIconColor: Theme.of(context).primaryColor,
            borderColor: Colors.black.withOpacity(0.2),
            borderRadius: 8,
            borderWidth: 1,
            focusedBorderWidth: 1,
            hintColor: Colors.black.withOpacity(0.2),
            fontSize: 14,
            hintFontSize: 14,
            paddingLeft: 35,
            paddingRight: 35,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        SizedBox(
          height: 50,
          child: FormHelper.inputFieldWidget(
            context,
            "mobilenumber",
            "Mobile Number",
            (onValidateVal) {
              if (onValidateVal.isEmpty) {
                return 'Host URL can\'t be empty.';
              }

              return null;
            },
            (onSavedVal) => {
              this.testText = onSavedVal,
            },
            initialValue: this.testText,
            obscureText: false,
            borderFocusColor: Colors.black,
            prefixIconColor: Theme.of(context).primaryColor,
            borderColor: Colors.black.withOpacity(0.2),
            borderRadius: 8,
            borderWidth: 1,
            focusedBorderWidth: 1,
            hintColor: Colors.black.withOpacity(0.2),
            fontSize: 14,
            hintFontSize: 14,
            paddingLeft: 35,
            paddingRight: 35,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        SizedBox(
          height: 50,
          child: FormHelper.inputFieldWidget(
            context,
            "password",
            "Password",
            (onValidateVal) {
              if (onValidateVal.isEmpty) {
                return 'Host URL can\'t be empty.';
              }

              return null;
            },
            (onSavedVal) => {
              this.testText = onSavedVal,
            },
            initialValue: this.testText,
            obscureText: true,
            borderFocusColor: Colors.black,
            prefixIconColor: Theme.of(context).primaryColor,
            borderColor: Colors.black.withOpacity(0.2),
            borderRadius: 8,
            borderWidth: 1,
            focusedBorderWidth: 1,
            hintColor: Colors.black.withOpacity(0.2),
            fontSize: 14,
            hintFontSize: 14,
            paddingLeft: 35,
            paddingRight: 35,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        SizedBox(
          height: 50,
          child: FormHelper.inputFieldWidget(
            context,
            "conpassword",
            "Confirm Password",
            (onValidateVal) {
              if (onValidateVal.isEmpty) {
                return 'Host URL can\'t be empty.';
              }

              return null;
            },
            (onSavedVal) => {
              this.testText = onSavedVal,
            },
            initialValue: this.testText,
            obscureText: true,
            borderFocusColor: Colors.black,
            prefixIconColor: Theme.of(context).primaryColor,
            borderColor: Colors.black.withOpacity(0.2),
            borderRadius: 8,
            borderWidth: 1,
            focusedBorderWidth: 1,
            hintColor: Colors.black.withOpacity(0.2),
            fontSize: 14,
            hintFontSize: 14,
            paddingLeft: 35,
            paddingRight: 35,
          ),
        ),
        SizedBox(
          height: 14,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            fixedSize: const Size(292, 50),
            primary: const Color.fromRGBO(76, 77, 79, 1), // background
            onPrimary: Colors.white, // foreground
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return MapHomeScreen();
            }));
          },
          child: const Text(
            'Continue',
            style: TextStyle(fontSize: 16),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        TextButton(
          child: Text(
            'Term & Privacy Policy',
            style:
                TextStyle(color: Color.fromRGBO(79, 175, 244, 1), fontSize: 12),
          ),
          onPressed: () {},
        ),
      ]),
    );
  }
}
