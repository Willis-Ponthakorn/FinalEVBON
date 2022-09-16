import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            'Change Password',
            textAlign: TextAlign.center,
          ),
          backgroundColor: Color.fromRGBO(20, 20, 20, 1),
          elevation: 1,
        ),
        body: Container(
          color: Color.fromRGBO(20, 20, 20, 1),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              TextField(
                obscureText: true,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0)),
                  labelText: 'Old Password',
                  labelStyle: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                obscureText: true,
                maxLength: 25,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0)),
                  labelText: 'Create new password',
                  labelStyle: TextStyle(fontSize: 15, color: Colors.white),
                  hintText: 'Password must be less than 25 characters',
                  hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
                  counterStyle: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                maxLength: 25,
                obscureText: true,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0)),
                  labelText: 'Confirm new password',
                  labelStyle: TextStyle(fontSize: 15, color: Colors.white),
                  hintText: 'Password must be less than 25 characters',
                  hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
                  counterStyle: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  fixedSize: const Size(292, 50),
                  primary: const Color.fromRGBO(76, 77, 79, 1), // background
                  onPrimary: Colors.white, // foreground
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Save changes',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ));
  }
}
