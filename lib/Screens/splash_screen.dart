import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_app_new/Screens/Onboarding/onboarding_main.dart';
import 'package:real_estate_app_new/Utils/navigation.dart';

import '../custom_widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(color: Colors.amber, image: DecorationImage(image: AssetImage('images/splash.png'), fit: BoxFit.cover)),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'images/Fader.png',
              fit: BoxFit.cover,
              width: size.width,
            ),
          ),
          Image.asset(
            'images/full_fade.png',
            fit: BoxFit.cover,
            width: size.width,
            height: size.height,
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset('images/logo.png'),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 200),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Rise",
                    style: GoogleFonts.lato(fontSize: 36, fontWeight: FontWeight.w700, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Real Estate",
                    style: GoogleFonts.lato(fontSize: 36, fontWeight: FontWeight.w700, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            right: 90,
            left: 90,
            child: Column(
              children: [
                CustomButton(
                  onTap: () {
                    nextPage(
                      context,
                      const OnBoardingScreen(),
                    );
                  },
                  text: "Let's just start",
                ),
                const SizedBox(height: 20),
                Text(
                  'Made with love',
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'v.1.0',
                  style: GoogleFonts.raleway(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
