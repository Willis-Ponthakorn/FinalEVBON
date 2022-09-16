import 'dart:io';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:snippet_coder_utils/list_helper.dart';
import 'package:snippet_coder_utils/multi_images_utils.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:my_flutter/screen/map.dart';
import 'package:my_flutter/screen/setting.dart';

class MapHomeScreen extends StatefulWidget {
  @override
  State<MapHomeScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<MapHomeScreen> {
  @override
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  String testText = "";
  String reqMod = "";
  final List<String> items = [
    'Audi Q4 e-tron 35',
    'Audi Q4 e-tron 40',
    'Audi e-tron quattro 50',
    'Audi e-tron quattro 55',
    'Audi RS e-Tron GT',
    'BMW iX',
    'BMW iX3',
    'BMW i4 M50',
    'BMW i4 eDrive40',
    'BMW i7 xDrive60',
    'BMW i3s',
    'Ford mustang march e-GT',
    'Honda Honda e 2021',
    'Mazda MX 30',
    'Mercedes EQA',
    'Mercedes EQB',
    'Mercedes EQC',
    'Mercedes EQE',
    'Mercedes EQS 450 +',
    'Mercedes EQS AMG 53',
    'Mercedes EQV',
    'Mercedes eVito Tourer',
    'MG ZS EV 2022',
    'MG MG 5 EV',
    'MG Marvel R',
    'Nissan Leaf',
    'Nissan Leaf e+',
    'Porche Taycan 4S',
    'Porche Taycan 4S Battery plus',
    'Porche Taycan 4S Taycan Turbo',
    'Porche Taycan 4S Taycan Turbo S',
    'Porche Taycan 4S Taycan GTS',
    'Porche Taycan 4S Taycan 4S Cross Turismo',
    'Porche Taycan 4S Taycan Turbo Cross Turi...',
    'Tesla model 3 (standard range)',
    'Tesla model 3 (long range)',
    'Tesla model 3 (performance)',
    'Tesla model y (standard range)',
    'Tesla model y (long range)',
    'Tesla model y (performance)',
    'Toyota bZ4X',
    'Toyota Proace Verso',
    'Volvo C40 Recharge Pure Electric',
    'Volvo XC40 Recharge Pure Electric'
  ];
  String? selectedValue;
  Widget build(BuildContext context) {
    final isKeyBoard = MediaQuery.of(context).viewInsets.bottom != 0;
    final double height = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final padding = MediaQuery.of(context).padding;
    double newheight = height - padding.top - padding.bottom;
    return Scaffold(
        body: Form(
            key: globalKey,
            child: SingleChildScrollView(
                child: Container(
              height: height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/Bg3.png"),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter),
                color: Color.fromRGBO(20, 20, 20, 1),
              ),
              child: Column(children: [
                SizedBox(
                  width: screenWidth,
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(20, 70, 0, 0),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return SettingScreen();
                            }));
                          },
                          child: CircleAvatar(
                              radius: 28,
                              backgroundImage: NetworkImage(
                                  'https://www.online-station.net/wp-content/uploads/2021/11/04rushiatoppa3-00a.jpg')),
                        ))),
                SizedBox(
                  height: height / 4,
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButtonFormField2(
                    buttonPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    hint: Text(
                      '   Select Car model',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    dropdownDecoration:
                        BoxDecoration(color: Color.fromRGBO(50, 55, 65, 1)),
                    items: items
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.white),
                              ),
                            ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value as String;
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Please select model.';
                      }
                    },
                    buttonHeight: 50,
                    itemHeight: 30,
                    buttonDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Color.fromRGBO(212, 17, 17, 1),
                        width: 2,
                      ),
                      color: Color.fromRGBO(50, 55, 65, 1),
                    ),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.all(10.0),
                    width: screenWidth * 5 / 6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromRGBO(32, 32, 34, 1),
                    ),
                    child: Column(children: [
                      SizedBox(height: 15),
                      const Text(
                        "Battery level",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: screenWidth * 2 / 3,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(50, 55, 65, 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 54,
                        child: FormHelper.inputFieldWidget(
                            context, "batterylevel", "Battery level",
                            (onValidateVal) {
                          if (onValidateVal.isEmpty) {
                            return 'battery level invaild';
                          }

                          return null;
                        },
                            (onSavedVal) => {
                                  this.testText = onSavedVal,
                                },
                            isNumeric: true,
                            initialValue: this.testText,
                            obscureText: false,
                            borderFocusColor: Colors.black.withOpacity(0),
                            prefixIconColor: Theme.of(context).primaryColor,
                            borderColor: Colors.black.withOpacity(0),
                            borderRadius: 8,
                            borderWidth: 1,
                            focusedBorderWidth: 1,
                            hintColor: Color.fromRGBO(81, 82, 90, 1),
                            fontSize: 14,
                            hintFontSize: 14,
                            paddingLeft: 10,
                            textColor: Colors.white),
                      ),
                      const SizedBox(height: 20),
                    ])),
                Container(
                    margin: const EdgeInsets.all(10.0),
                    width: screenWidth * 5 / 6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromRGBO(32, 32, 34, 1),
                    ),
                    child: Column(children: [
                      SizedBox(height: 15),
                      const Text(
                        "Mile number ODO",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: screenWidth * 2 / 3,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(50, 55, 65, 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 54,
                        child: FormHelper.inputFieldWidget(
                            context, "numberodo", "Mile number ODO",
                            (onValidateVal) {
                          if (onValidateVal.isEmpty) {
                            return 'ODO invaild';
                          }

                          return null;
                        },
                            (onSavedVal) => {
                                  this.testText = onSavedVal,
                                },
                            isNumeric: true,
                            initialValue: this.testText,
                            obscureText: false,
                            borderFocusColor: Colors.black.withOpacity(0),
                            prefixIconColor: Theme.of(context).primaryColor,
                            borderColor: Colors.black.withOpacity(0),
                            borderRadius: 8,
                            borderWidth: 1,
                            focusedBorderWidth: 1,
                            hintColor: Color.fromRGBO(81, 82, 90, 1),
                            fontSize: 14,
                            hintFontSize: 14,
                            paddingLeft: 10,
                            textColor: Colors.white),
                      ),
                      const SizedBox(height: 20),
                    ])),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    fixedSize: const Size(256, 34),
                    primary: const Color.fromRGBO(76, 77, 79, 1), // background
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () {
                    if (validateAndSave()) {
                      print("done");
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return MapsPage();
                      }));
                    }
                  },
                  child: const Text(
                    'Continue',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ]),
            ))));
  }

  bool validateAndSave() {
    final form = globalKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}
