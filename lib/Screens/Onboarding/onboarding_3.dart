import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoarding3 extends StatelessWidget {
  const OnBoarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Find ",
                        style: GoogleFonts.lato(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: "perfect choice ",
                        style: GoogleFonts.raleway(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff204D6C),
                        ),
                      ),
                      TextSpan(
                        text: "for ",
                        style: GoogleFonts.lato(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "your future house ",
                  style: GoogleFonts.lato(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur ',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.lato(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'adipiscing elit, sed. ',
                  style: GoogleFonts.lato(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('images/onboard3.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(40),
              ),
            ),
          )
        ],
      ),
    );
  }
}
