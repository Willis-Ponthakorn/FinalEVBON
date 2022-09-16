import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:my_flutter/screen/map.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class CreditCard {
  final String cardNumber;
  final String expiryDate;
  final String cvv;
  final String name;

  const CreditCard({
    required this.cardNumber,
    required this.expiryDate,
    required this.cvv,
    required this.name,
  });
}

int val = 0;

class _PaymentScreenState extends State<PaymentScreen> {
  List<CreditCard> items = [
    CreditCard(
      cardNumber: '3827463731037389',
      expiryDate: '02/30',
      cvv: '733',
      name: 'Daniel Austin',
    )
  ];
  List card = ['assets/images/card1.png', 'assets/images/card2.png'];
  String testText = "";

  @override
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
            onPressed: () {},
          ),
          title: Text(
            'Payment',
            textAlign: TextAlign.center,
          ),
          backgroundColor: Color.fromRGBO(20, 20, 20, 1),
          elevation: 1,
        ),
        body: Container(
            color: Color.fromRGBO(20, 20, 20, 1),
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    SizedBox(width: 30),
                    buildCreditCard(),
                    SizedBox(width: 12),
                    buildCreditCard2(),
                    SizedBox(width: 30),
                  ]),
                ),
                SizedBox(height: 20),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      fixedSize: const Size(180, 44),
                      primary: Colors.white,
                      side: const BorderSide(width: 1, color: Colors.white)),
                  onPressed: () {
                    showModalBottomSheet<void>(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return Form(
                            key: globalKey,
                            child: Padding(
                              padding: MediaQuery.of(context).viewInsets,
                              child: Container(
                                height: MediaQuery.of(context).size.height / 2,
                                color: Color.fromRGBO(32, 32, 32, 1),
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 35, bottom: 10),
                                        child: const Text(
                                          'Card Number',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: SizedBox(
                                          height: 50,
                                          child: FormHelper.inputFieldWidget(
                                            context,
                                            "cardnumber",
                                            "Card Number",
                                            (onValidateVal) {
                                              if (onValidateVal.isEmpty) {
                                                return 'card number invalid';
                                              }

                                              return null;
                                            },
                                            (onSavedVal) => {
                                              this.testText = onSavedVal,
                                            },
                                            textColor: Colors.white,
                                            isNumeric: true,
                                            initialValue: this.testText,
                                            obscureText: false,
                                            borderFocusColor: Colors.black,
                                            prefixIconColor:
                                                Theme.of(context).primaryColor,
                                            borderColor:
                                                Colors.black.withOpacity(0.2),
                                            borderRadius: 8,
                                            borderWidth: 1,
                                            focusedBorderWidth: 1,
                                            hintColor:
                                                Color.fromRGBO(81, 82, 90, 1),
                                            fontSize: 14,
                                            hintFontSize: 14,
                                            paddingLeft: 35,
                                            paddingRight: 35,
                                            backgroundColor:
                                                Color.fromRGBO(50, 55, 65, 1),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 35, bottom: 10, top: 10),
                                        child: const Text(
                                          'Card Holder Name',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: SizedBox(
                                          height: 50,
                                          child: FormHelper.inputFieldWidget(
                                            context,
                                            "cardholdername",
                                            "Card Holder Name",
                                            (onValidateVal) {
                                              if (onValidateVal.isEmpty) {
                                                return 'name invalid';
                                              }

                                              return null;
                                            },
                                            (onSavedVal) => {
                                              this.testText = onSavedVal,
                                            },
                                            textColor: Colors.white,
                                            initialValue: this.testText,
                                            obscureText: false,
                                            borderFocusColor: Colors.black,
                                            prefixIconColor:
                                                Theme.of(context).primaryColor,
                                            borderColor:
                                                Colors.black.withOpacity(0.2),
                                            borderRadius: 8,
                                            borderWidth: 1,
                                            focusedBorderWidth: 1,
                                            hintColor:
                                                Color.fromRGBO(81, 82, 90, 1),
                                            fontSize: 14,
                                            hintFontSize: 14,
                                            paddingLeft: 35,
                                            paddingRight: 35,
                                            backgroundColor:
                                                Color.fromRGBO(50, 55, 65, 1),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 35, bottom: 10, top: 10),
                                            child: Text(
                                              'Expiry date',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                right: 100,
                                                bottom: 10,
                                                top: 10),
                                            child: Text(
                                              'CVV',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            child: Container(
                                              child: SizedBox(
                                                height: 50,
                                                child:
                                                    FormHelper.inputFieldWidget(
                                                  context,
                                                  "mm",
                                                  "MM",
                                                  (onValidateVal) {
                                                    if (onValidateVal.isEmpty) {
                                                      return 'month invalid';
                                                    }

                                                    return null;
                                                  },
                                                  (onSavedVal) => {
                                                    this.testText = onSavedVal,
                                                  },
                                                  isNumeric: true,
                                                  initialValue: this.testText,
                                                  obscureText: false,
                                                  borderFocusColor:
                                                      Colors.black,
                                                  prefixIconColor:
                                                      Theme.of(context)
                                                          .primaryColor,
                                                  borderColor: Colors.black
                                                      .withOpacity(0.2),
                                                  borderRadius: 8,
                                                  borderWidth: 1,
                                                  focusedBorderWidth: 1,
                                                  hintColor: Color.fromRGBO(
                                                      81, 82, 90, 1),
                                                  fontSize: 14,
                                                  hintFontSize: 14,
                                                  paddingLeft: 35,
                                                  paddingRight: 0,
                                                  textColor: Colors.white,
                                                  backgroundColor:
                                                      Color.fromRGBO(
                                                          50, 55, 65, 1),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: Container(
                                              child: SizedBox(
                                                height: 50,
                                                child:
                                                    FormHelper.inputFieldWidget(
                                                  context,
                                                  "yy",
                                                  "YY",
                                                  (onValidateVal) {
                                                    if (onValidateVal.isEmpty) {
                                                      return 'year invaild';
                                                    }

                                                    return null;
                                                  },
                                                  (onSavedVal) => {
                                                    this.testText = onSavedVal,
                                                  },
                                                  isNumeric: true,
                                                  initialValue: this.testText,
                                                  obscureText: false,
                                                  borderFocusColor:
                                                      Colors.black,
                                                  prefixIconColor:
                                                      Theme.of(context)
                                                          .primaryColor,
                                                  borderColor: Colors.black
                                                      .withOpacity(0.2),
                                                  borderRadius: 8,
                                                  borderWidth: 1,
                                                  focusedBorderWidth: 1,
                                                  hintColor: Color.fromRGBO(
                                                      81, 82, 90, 1),
                                                  fontSize: 14,
                                                  hintFontSize: 14,
                                                  paddingLeft: 15,
                                                  paddingRight: 15,
                                                  textColor: Colors.white,
                                                  backgroundColor:
                                                      Color.fromRGBO(
                                                          50, 55, 65, 1),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: Container(
                                              child: SizedBox(
                                                height: 50,
                                                child:
                                                    FormHelper.inputFieldWidget(
                                                  context,
                                                  "cvv",
                                                  "CVV",
                                                  (onValidateVal) {
                                                    if (onValidateVal.isEmpty) {
                                                      return 'cvv invalid';
                                                    }

                                                    return null;
                                                  },
                                                  (onSavedVal) => {
                                                    this.testText = onSavedVal,
                                                  },
                                                  isNumeric: true,
                                                  initialValue: this.testText,
                                                  obscureText: false,
                                                  borderFocusColor:
                                                      Colors.black,
                                                  prefixIconColor:
                                                      Theme.of(context)
                                                          .primaryColor,
                                                  borderColor: Colors.black
                                                      .withOpacity(0.2),
                                                  borderRadius: 8,
                                                  borderWidth: 1,
                                                  focusedBorderWidth: 1,
                                                  hintColor: Color.fromRGBO(
                                                      81, 82, 90, 1),
                                                  fontSize: 14,
                                                  hintFontSize: 14,
                                                  paddingLeft: 0,
                                                  paddingRight: 35,
                                                  textColor: Colors.white,
                                                  backgroundColor:
                                                      Color.fromRGBO(
                                                          50, 55, 65, 1),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Center(
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            fixedSize: const Size(256, 34),
                                            primary: const Color.fromRGBO(
                                                76, 77, 79, 1), // background
                                            onPrimary:
                                                Colors.white, // foreground
                                          ),
                                          onPressed: () {
                                            if (validateAndSave()) {
                                              print("done");
                                            }
                                            showAlertDialog(context);
                                          },
                                          child: const Text(
                                            'Continue',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ));
                      },
                    );
                  },
                  child: const Text(
                    '+ Add card',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Spacer(),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    color: Color.fromRGBO(32, 32, 32, 1),
                    child: Stack(
                      children: [
                        Positioned(
                            top: 50,
                            left: 30,
                            child: Text(
                              'Total',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                        Positioned(
                            top: 82,
                            left: 30,
                            child: Text(
                              '20 Baht',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                        Positioned(
                          top: 80,
                          right: 30,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              fixedSize: const Size(140, 44),
                              primary: const Color.fromRGBO(
                                  212, 17, 17, 1), // background
                              onPrimary: Colors.white, // foreground
                            ),
                            onPressed: () {
                              val++;
                              showAlertDialog(context);
                            },
                            child: const Text(
                              'Continue',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        )
                      ],
                    ))
              ],
            )));
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

  Widget buildCreditCard() => Container(
      width: 340,
      height: 200,
      decoration: const BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/images/card1.png"),
            alignment: Alignment.topCenter),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 80,
            left: 30,
            child: Text(
              '3827463731037389'
                  .replaceRange(1, 9, 'XXXXXXXX')
                  .replaceAllMapped(
                      RegExp(r".{4}"), (match) => "${match.group(0)} "),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 30,
            child: Text(
              'Card Holder Name',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 30,
            child: Text(
              'Daniel Austin',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 170,
            child: Text(
              'Expiry date',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 170,
            child: Text(
              '02/30',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ));

  Widget buildCreditCard2() => Container(
      width: 340,
      height: 200,
      decoration: const BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/images/card2.png"),
            alignment: Alignment.topCenter),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 80,
            left: 30,
            child: Text(
              '3827463731037389'
                  .replaceRange(1, 9, 'XXXXXXXX')
                  .replaceAllMapped(
                      RegExp(r".{4}"), (match) => "${match.group(0)} "),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 30,
            child: Text(
              'Card Holder Name',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 30,
            child: Text(
              'Daniel Austin',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 170,
            child: Text(
              'Expiry date',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 170,
            child: Text(
              '02/30',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ));
}

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton1 = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget okButton2 = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return MapsPage();
      }));
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Card Added"),
    content: Text("You can now use this card."),
    actions: [
      okButton1,
    ],
  );
  AlertDialog alert2 = AlertDialog(
    title: Text("Payment Successful"),
    content: Text("You have completed your payment."),
    actions: [
      okButton2,
    ],
  );

  // show the dialog
  showDialog(
      context: context,
      builder: (BuildContext context) {
        if (val <= 0) {
          return alert;
        } else if (val >= 0) {
          return alert2;
        } else {
          return alert;
        }
      });
}
