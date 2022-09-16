import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  Timer? countdownTimer;
  Duration myDuration = Duration(minutes: 3);
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  /// Timer related methods ///
  // Step 3
  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  void resetTimer() {
    stopTimer();
    setState(() => myDuration = Duration(minutes: 3));
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    const maxTime = 180;
    int timertext = maxTime;
    Timer? timers;
    Duration timer = Duration(seconds: timertext);
    final double height = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final padding = MediaQuery.of(context).padding;
    double newheight = height - padding.top - padding.bottom;
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/Bg2.png"),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(212, 17, 17, 1),
                    Color.fromRGBO(20, 20, 20, 1)
                  ]),
            ),
            child: Center(
                child: Container(
              margin: const EdgeInsets.all(10.0),
              width: screenWidth * 4 / 5,
              height: height * 259 / 463,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
              ),
              child: Column(children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.arrow_back_ios_new)),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 259 / 463 / 8),
                  child: const Text(
                    "Confirm OTP",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "Enter OTP we just sent to your Email",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                Form(
                    child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      screenWidth * 4 / 40, 15, screenWidth * 4 / 40, 0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            height: 48,
                            width: 46,
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              onSaved: (pin1) {},
                              decoration: InputDecoration(
                                fillColor: Color.fromRGBO(217, 217, 217, 1),
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              style: Theme.of(context).textTheme.headline6,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            )),
                        SizedBox(
                            height: 48,
                            width: 46,
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              onSaved: (pin1) {},
                              decoration: InputDecoration(
                                fillColor: Color.fromRGBO(217, 217, 217, 1),
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              style: Theme.of(context).textTheme.headline6,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            )),
                        SizedBox(
                            height: 48,
                            width: 46,
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              onSaved: (pin1) {},
                              decoration: InputDecoration(
                                fillColor: Color.fromRGBO(217, 217, 217, 1),
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              style: Theme.of(context).textTheme.headline6,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            )),
                        SizedBox(
                            height: 48,
                            width: 46,
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              onSaved: (pin1) {},
                              decoration: InputDecoration(
                                fillColor: Color.fromRGBO(217, 217, 217, 1),
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              style: Theme.of(context).textTheme.headline6,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            )),
                      ]),
                )),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      screenWidth * 4 / 40, 10, screenWidth * 4 / 40, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "Time Remaining ${myDuration.inMinutes.remainder(60).toString()}:${myDuration.inSeconds.remainder(60).toString().padLeft(2, '0')}s",
                          style: const TextStyle(fontSize: 12)),
                      TextButton(
                        child: Text(
                          'Resend',
                          style: TextStyle(
                              color: Color.fromRGBO(79, 175, 244, 1),
                              fontSize: 12,
                              decoration: TextDecoration.underline),
                        ),
                        onPressed: () {
                          resetTimer();
                        },
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    fixedSize: const Size(256, 34),
                    primary: const Color.fromRGBO(76, 77, 79, 1), // background
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Verify',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ]),
            ))));
  }
}
