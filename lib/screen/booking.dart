import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:my_flutter/screen/payment.dart';
import 'package:my_flutter/screen/map.dart';

final val = ValueNotifier<int>(0);
int min = 30;

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  List<bool> isSelected1 = [true];
  List<bool> isSelected2 = [false];
  final List<String> items = typeac;
  String? selectedValue;

  String firstFewWords(String bigSentence) {
    int startIndex = 0;
    late int indexOfSpace;

    for (int i = 0; i < 4; i++) {
      indexOfSpace = bigSentence.indexOf(' ', startIndex);
      if (indexOfSpace == -1) {
        //-1 is when character is not found
        return bigSentence;
      }
      startIndex = indexOfSpace + 1;
    }
    return bigSentence.substring(0, indexOfSpace) + '...';
  }

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    bool validateAndSave() {
      final form = globalKey.currentState;
      if (form!.validate()) {
        form.save();
        return true;
      } else {
        return false;
      }
    }

    final screenWidth = MediaQuery.of(context).size.width;
    Map station = stations[selected_id];
    void removedata() {
      items.clear();
    }

    void hastype1() {
      for (var i = 0; i < station['Charger'].length; i++) {
        if (station['Charger'][i]['ConnectorType'] == 'Type 1') {
          items.add('Type 1');
          break;
        }
      }
    }

    void hastype2() {
      for (var i = 0; i < station['Charger'].length; i++) {
        if (station['Charger'][i]['ConnectorType'] == 'Type 2') {
          items.add('Type 2');
          break;
        }
      }
    }

    void hasCCS2() {
      for (var i = 0; i < station['Charger'].length; i++) {
        if (station['Charger'][i]['ConnectorType'] == 'CCS 2' ||
            station['Charger'][i]['ConnectorType'] == 'CCS2') {
          items.add('CCS 2');
          break;
        }
      }
    }

    void hasCHAdeMO() {
      for (var i = 0; i < station['Charger'].length; i++) {
        if (station['Charger'][i]['ConnectorType'] == 'CHAdeMO') {
          items.add('CHAdeMO');
          break;
        }
      }
    }

    void managedataac() {
      removedata();
      hastype1();
      hastype2();
    }

    void managedatadc() {
      removedata();
      hasCCS2();
      hasCHAdeMO();
    }

    //////////
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Booking Charger',
            textAlign: TextAlign.center,
          ),
          backgroundColor: Color.fromRGBO(20, 20, 20, 1),
          elevation: 1,
        ),
        body: Form(
            key: globalKey,
            child: Container(
                color: Color.fromRGBO(20, 20, 20, 1),
                child: Column(children: [
                  ListTile(
                    contentPadding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Text(
                        firstFewWords(station['name'].toString()),
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                    subtitle: Row(children: [
                      Text(
                        'Status     ',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(62, 255, 31, 1),
                        ),
                      ),
                      Text(
                        '  ' + (station['status']).toString(),
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      )
                    ]),
                    trailing: Text(
                      '(' +
                          (station['distance'] * 1000).toStringAsFixed(1) +
                          ' M)',
                      style: TextStyle(color: Color.fromRGBO(212, 17, 17, 1)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ToggleButtons(
                    borderWidth: 2,
                    borderColor: Color.fromRGBO(32, 32, 32, 1),
                    selectedBorderColor: Color.fromRGBO(212, 17, 17, 1),
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(32, 32, 32, 1),
                        ),
                        padding: EdgeInsets.fromLTRB(20, 30, 20, 43),
                        width: screenWidth - 40,
                        child: Column(children: [
                          Text(
                            'AC',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 64,
                            ),
                          ),
                          Text(
                            'Normal Charge',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ]),
                      )
                    ],
                    onPressed: (int index) {
                      setState(() {
                        isSelected1[index] = true;
                        isSelected2[index] = false;
                        managedataac();
                        selectedValue = null;
                        val.value++;
                      });
                    },
                    isSelected: isSelected1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ToggleButtons(
                    borderWidth: 2,
                    borderColor: Color.fromRGBO(32, 32, 32, 1),
                    selectedBorderColor: Color.fromRGBO(212, 17, 17, 1),
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(32, 32, 32, 1),
                        ),
                        padding: EdgeInsets.fromLTRB(20, 30, 20, 43),
                        width: screenWidth - 40,
                        child: Column(children: [
                          Text(
                            'DC',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 64,
                            ),
                          ),
                          Text(
                            'Quick Charge',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ]),
                      )
                    ],
                    onPressed: (int index) {
                      setState(() {
                        isSelected1[index] = false;
                        isSelected2[index] = true;
                        managedatadc();
                        selectedValue = null;
                        val.value++;
                      });
                    },
                    isSelected: isSelected2,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ValueListenableBuilder(
                      valueListenable: val,
                      builder: (context, value, widget) {
                        return DropdownButtonHideUnderline(
                          child: DropdownButtonFormField2(
                            validator: (value) {
                              if (value == null) {
                                return 'Please select connector type.';
                              }
                            },
                            dropdownDecoration: BoxDecoration(
                                color: Color.fromRGBO(50, 55, 65, 1)),
                            hint: Text(
                              '   Connector type',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                            items: items
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        '  ' + item,
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
                            buttonHeight: 50,
                            buttonWidth: screenWidth - 40,
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
                        );
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      fixedSize: const Size(256, 34),
                      primary:
                          const Color.fromRGBO(76, 77, 79, 1), // background
                      onPrimary: Colors.white, // foreground
                    ),
                    onPressed: () {
                      if (validateAndSave()) {
                        selectedValue = null;
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return PaymentScreen();
                        }));
                        print("done");
                      }
                    },
                    child: const Text(
                      'Continue',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ]))));
  }
}
