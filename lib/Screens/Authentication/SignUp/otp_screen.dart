import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_app_new/Screens/Authentication/SignUp/account_location.dart';

import '../../../Utils/navigation.dart';
import '../../../custom_widgets.dart';

class OtpPage extends StatefulWidget {
  final String email;
  const OtpPage({super.key, required this.email});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 60;
  late CountdownTimerController controller;

  @override
  void initState() {
    controller = CountdownTimerController(endTime: endTime);
    super.initState();
  }

  void onEnd() {
    print('onEnd');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BackBtn(),
              const SizedBox(height: 60),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Enter the ',
                      style: GoogleFonts.raleway(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff252B5C),
                      ),
                    ),
                    TextSpan(
                      text: 'Code ',
                      style: GoogleFonts.raleway(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xff252B5C),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Text(
                'Enter the 4 digit code that we just sent to ',
                style: GoogleFonts.lato(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff252B5C),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.email,
                style: GoogleFonts.lato(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff252B5C),
                ),
              ),
              const SizedBox(height: 100),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        color: const Color(0xffF5F4F8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: TextFormField(
                          cursorColor: const Color(0xff252B5C),
                          style: const TextStyle(
                            color: Color(0xff252B5C),
                            fontSize: 20,
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        color: const Color(0xffF5F4F8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: TextFormField(
                          cursorColor: const Color(0xff252B5C),
                          style: const TextStyle(
                            color: Color(0xff252B5C),
                            fontSize: 20,
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        color: const Color(0xffF5F4F8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: TextFormField(
                          cursorColor: const Color(0xff252B5C),
                          style: const TextStyle(
                            color: Color(0xff252B5C),
                            fontSize: 20,
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        color: const Color(0xffF5F4F8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: TextFormField(
                          cursorColor: const Color(0xff252B5C),
                          style: const TextStyle(
                            color: Color(0xff252B5C),
                            fontSize: 20,
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 200),
              Center(
                child: Container(
                  width: 90,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xffF5F4F8),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(FontAwesomeIcons.stopwatch),
                      const SizedBox(width: 10),
                      CountdownTimer(
                        endTime: endTime,
                        widgetBuilder: (_, time) {
                          if (time == null) {
                            return const Text('00:00');
                          }
                          return Text('${time.min ?? '00'} ${time.sec}');
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Didn't recieve an OTP? ",
                        style: GoogleFonts.raleway(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff53587A),
                        ),
                      ),
                      TextSpan(
                        text: 'Resend OTP ',
                        style: GoogleFonts.raleway(
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          color: const Color(0xff252B5C),
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => nextPage(
                                context,
                                const AccountLocation1(),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
