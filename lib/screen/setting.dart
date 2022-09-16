import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_flutter/screen/changepassword.dart';
import 'package:my_flutter/screen/editprofile.dart';
import 'package:my_flutter/screen/home.dart';
import 'package:my_flutter/screen/maphome.dart';
import 'package:my_flutter/screen/login.dart';
import 'package:my_flutter/screen/payment.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            'Settings',
            textAlign: TextAlign.center,
          ),
          backgroundColor: Color.fromRGBO(20, 20, 20, 1),
          elevation: 1,
        ),
        body: Container(
          color: Color.fromRGBO(20, 20, 20, 1),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Stack(
                    children: [
                      Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                              border: Border.all(width: 4, color: Colors.black),
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      'https://www.online-station.net/wp-content/uploads/2021/11/04rushiatoppa3-00a.jpg')))),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 4,
                                color: Color.fromRGBO(20, 20, 20, 1),
                              ),
                              color: Colors.white,
                            ),
                            child: Icon(
                              Icons.edit,
                              color: Color.fromRGBO(20, 20, 20, 1),
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Uhara Rushia',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  'Uhara@Rushia.com',
                  style: TextStyle(
                    color: Color.fromRGBO(139, 139, 139, 1),
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return EditProfileScreen();
                    }));
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        width: 50,
                      ),
                      Icon(
                        FontAwesomeIcons.user,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Edit Profile",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: 150,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Divider(
                  height: 1,
                  thickness: 0.1,
                  indent: 20,
                  endIndent: 20,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      SizedBox(
                        width: 50,
                      ),
                      Icon(
                        FontAwesomeIcons.creditCard,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Payment",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: 170,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Divider(
                  height: 1,
                  thickness: 0.1,
                  indent: 20,
                  endIndent: 20,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ChangePasswordScreen();
                    }));
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        width: 50,
                      ),
                      Icon(
                        FontAwesomeIcons.key,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Change Password",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: 90,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Divider(
                  height: 1,
                  thickness: 0.1,
                  indent: 20,
                  endIndent: 20,
                  color: Colors.white,
                ),
                SizedBox(height: 30),
                SizedBox(
                  height: 90,
                ),
                GestureDetector(
                  onTap: () {
                    showAlertDialog(context);
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        width: 50,
                      ),
                      Icon(
                        FontAwesomeIcons.arrowRightFromBracket,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Log out",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: 90,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HomeScreen();
      }));
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Logout"),
    content: Text("Are you sure you want to log out?"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}
