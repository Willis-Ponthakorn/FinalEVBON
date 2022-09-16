import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class EditNumberScreen extends StatefulWidget {
  const EditNumberScreen({Key? key}) : super(key: key);

  @override
  State<EditNumberScreen> createState() => _EditNumberScreenState();
}

class _EditNumberScreenState extends State<EditNumberScreen> {
  @override
  String testText = "";
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back, color: Colors.white),
          ),
          title: Text(
            'Phone Number',
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
              Padding(
                padding: EdgeInsets.fromLTRB(35, 0, 35, 0),
                child: TextField(
                  maxLength: 10,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white, width: 2.0)),
                    labelText: 'Confirm new phone number',
                    labelStyle: TextStyle(fontSize: 15, color: Colors.white),
                    hintText: 'Phone number must be 10 characters',
                    hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
                    counterStyle: TextStyle(fontSize: 12, color: Colors.white),
                  ),
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
