import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_app_new/Screens/Authentication/SignUp/estate_pref2.dart';
import 'package:real_estate_app_new/Screens/BasePage/base_page.dart';

import '../../../Utils/navigation.dart';
import '../../../custom_widgets.dart';

class EstatePref1 extends StatefulWidget {
  const EstatePref1({super.key});

  @override
  State<EstatePref1> createState() => _EstatePref1State();
}

class _EstatePref1State extends State<EstatePref1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appBar(
                  context,
                  const BasePage(),
                  const BackBtn(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 60),
                      Text(
                        'Select your preferable ',
                        style: GoogleFonts.raleway(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff252B5C),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'real estate type ',
                        style: GoogleFonts.raleway(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                          color: const Color(0xff252B5C),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        'you can edit this later in your account settings',
                        style: GoogleFonts.lato(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff53587A),
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
                Expanded(
                  child: GridView(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    controller: ScrollController(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 3),
                    children: [
                      Image.asset('images/1.png'),
                      Image.asset('images/2.png'),
                      Image.asset('images/3.png'),
                      Image.asset('images/4.png'),
                      Image.asset('images/5.png'),
                      Image.asset('images/6.png'),
                      Image.asset('images/7.png'),
                      Image.asset('images/8.png'),
                      Image.asset('images/9.png'),
                      Image.asset('images/10.png'),
                      Image.asset('images/11.png'),
                      Image.asset('images/12.png'),
                      Image.asset('images/13.png'),
                      Image.asset('images/14.png'),
                      Image.asset('images/15.png'),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 30,
              left: 50,
              right: 50,
              child: Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 35,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: CustomBigBtn(
                    child: const Center(
                      child: Text(
                        'Show More',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onTap: () {
                      nextPage(context, const EstatePref2());
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
