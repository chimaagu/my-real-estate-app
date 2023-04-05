import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_app_new/Screens/Authentication/Login/login_email.dart';
import 'package:real_estate_app_new/Utils/navigation.dart';

import '../../../custom_widgets.dart';
import '../SignUp/create_account.dart';

class LoginOption extends StatelessWidget {
  const LoginOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GridView(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
              children: [
                SizedBox(
                  height: 160,
                  child: Image.asset(
                    'images/login2.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 160,
                  child: Image.asset(
                    'images/login1.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 160,
                  child: Image.asset(
                    'images/login3.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 160,
                  child: Image.asset(
                    'images/login4.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Ready to ',
                    style: GoogleFonts.lato(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff1F4C6B),
                    ),
                  ),
                  TextSpan(
                    text: 'explore? ',
                    style: GoogleFonts.raleway(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xff252B5C),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Align(
              alignment: Alignment.center,
              child: CustomBigBtn(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.email_outlined,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Continue with email',
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  nextPage(
                    context,
                    const EmailLoginPage(),
                  );
                },
              ),
            ),
            const SizedBox(height: 50),
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
            const SizedBox(height: 20),
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
          ],
        ),
      ),
    );
  }
}
