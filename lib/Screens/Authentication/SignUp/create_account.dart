import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_app_new/Screens/Authentication/SignUp/otp_screen.dart';
import 'package:real_estate_app_new/custom_widgets.dart';

import '../../../Utils/navigation.dart';
import '../Login/login_faq.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController email = TextEditingController();
  TextEditingController fullName = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isObscure = false;
  String emailText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    previousPage(context);
                  },
                  child: const CircleAvatar(
                    radius: 25,
                    backgroundColor: Color(0xffF5F4F8),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Create your ',
                        style: GoogleFonts.raleway(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff252B5C),
                        ),
                      ),
                      TextSpan(
                        text: 'Account ',
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
                  'quis nostrud exercitation ullamco laboris nisi ut',
                  style: GoogleFonts.lato(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff53587A),
                  ),
                ),
                const SizedBox(height: 50),
                CustomTextField(
                  icon: FontAwesomeIcons.person,
                  hint: 'Full Name',
                  isReadOnly: false,
                  controller: fullName,
                  isObscure: false,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  icon: Icons.email_outlined,
                  hint: 'Email',
                  isReadOnly: false,
                  controller: email,
                  isObscure: false,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  icon: FontAwesomeIcons.lock,
                  hint: 'Password',
                  isReadOnly: false,
                  controller: password,
                  isObscure: isObscure,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        nextPage(context, const LoginFaq());
                      },
                      child: Text(
                        'Terms of service',
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
                          ),
                  ],
                ),
                const SizedBox(height: 30),
                Center(
                  child: CustomBigBtn(
                    child: Center(
                      child: Text(
                        'Register',
                        style: GoogleFonts.lato(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        emailText = email.text;
                      });
                      nextPage(context, OtpPage(email: emailText));
                    },
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
