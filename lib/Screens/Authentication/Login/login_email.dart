import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_app_new/Screens/Authentication/SignUp/create_account.dart';
import 'package:real_estate_app_new/Utils/navigation.dart';

import '../../../custom_widgets.dart';

class EmailLoginPage extends StatefulWidget {
  const EmailLoginPage({super.key});

  @override
  State<EmailLoginPage> createState() => _EmailLoginPageState();
}

class _EmailLoginPageState extends State<EmailLoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isObscure = false;
  bool errorVisible = false;
  String errorText = '';
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'images/emty_pple.png',
              height: 175,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Let's ",
                          style: GoogleFonts.lato(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff1F4C6B),
                          ),
                        ),
                        TextSpan(
                          text: 'Sign In ',
                          style: GoogleFonts.raleway(
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                            color: const Color(0xff252B5C),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'quis nostrud exercitation ullamco laboris nisi ut',
                    style: GoogleFonts.lato(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff53587A),
                    ),
                  ),
                  const SizedBox(height: 30),

                  Visibility(
                    visible: errorVisible,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff234F68),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: 50,
                      child: Center(
                        child: Text(
                          errorText,
                          style: GoogleFonts.lato(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Form(
                    key: key,
                    child: Column(
                      children: [
                        CustomTextField(
                          isObscure: false,
                          controller: emailController,
                          onTap: () {},
                          isReadOnly: false,
                          hint: 'Email',
                          icon: Icons.email_outlined,
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          isObscure: isObscure,
                          controller: passwordController,
                          onTap: () {},
                          isReadOnly: false,
                          hint: 'Password',
                          icon: Icons.lock_outline_rounded,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'Forgot Password?',
                          style: GoogleFonts.raleway(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff252B5C),
                          ),
                        ),
                      ),
                      isObscure == false
                          ? InkWell(
                              onTap: () {
                                setState(() {
                                  isObscure = !isObscure;
                                });
                              },
                              child: Text(
                                'hide Password',
                                style: GoogleFonts.raleway(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff252B5C),
                                ),
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                setState(() {
                                  isObscure = !isObscure;
                                });
                              },
                              child: Text(
                                'show Password',
                                style: GoogleFonts.raleway(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff252B5C),
                                ),
                              ),
                            )
                    ],
                  ),
                  const SizedBox(height: 50),

                  Center(
                    child: CustomBigBtn(
                      child: Center(
                        child: Text(
                          'Login',
                          style: GoogleFonts.lato(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      onTap: () {
                        key.currentState!.validate();
                        if (emailController.text == '') {
                          setState(() {
                            errorVisible = true;
                            errorText = 'Email Cannot be empyty';
                          });
                        } else if (!emailController.text.contains('@gmail.com')) {
                          setState(() {
                            errorVisible = true;
                            errorText = 'Please Enter a valid Email address';
                          });
                        } else {
                          setState(() {
                            errorVisible = false;
                          });
                        }
                      },
                    ),
                  ),
                  // const SizedBox(height: 20),
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      const Flexible(
                        child: Divider(thickness: 2),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'OR',
                        style: GoogleFonts.raleway(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xffA1A5C1),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Flexible(
                        child: Divider(thickness: 2),
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: const Color(0xffF5F4F8),
                          ),
                          child: Center(
                            child: Image.asset('images/ggle.png'),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: const Color(0xffF5F4F8),
                          ),
                          child: Center(
                            child: Image.asset('images/fb.png'),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  Align(
                    alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Don't have an account? ",
                            style: GoogleFonts.lato(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff1F4C6B),
                            ),
                          ),
                          TextSpan(
                            text: 'Register ',
                            style: GoogleFonts.raleway(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xff252B5C),
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                nextPage(context, const CreateAccount());
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
