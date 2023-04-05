import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_app_new/Screens/Authentication/SignUp/Location/choose_location.dart';
import 'package:real_estate_app_new/Screens/BasePage/base_page.dart';
import 'package:real_estate_app_new/Utils/navigation.dart';
import 'package:real_estate_app_new/custom_widgets.dart';

class AccountLocation1 extends StatefulWidget {
  const AccountLocation1({super.key});

  @override
  State<AccountLocation1> createState() => _AccountLocation1State();
}

class _AccountLocation1State extends State<AccountLocation1> {
  final TextEditingController locaction = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appBar(
              context,
              const BasePage(),
              const BackBtn(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Add your ',
                          style: GoogleFonts.raleway(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff252B5C),
                          ),
                        ),
                        TextSpan(
                          text: 'Location ',
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
                    'You can edit this later on your account setting. ',
                    style: GoogleFonts.lato(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff252B5C),
                    ),
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      'images/map.png',
                      fit: BoxFit.fill,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    isReadOnly: false,
                    controller: locaction,
                    isObscure: false,
                    icon: Icons.location_on_rounded,
                    hint: 'Location Detail',
                  ),
                  const SizedBox(height: 120),
                  Center(
                    child: CustomBigBtn(
                      child: Center(
                        child: Text(
                          'Next',
                          style: GoogleFonts.lato(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      onTap: () {
                        nextPage(context, const ChooseLocation());
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
