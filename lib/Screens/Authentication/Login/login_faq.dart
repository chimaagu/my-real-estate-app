import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_app_new/Utils/navigation.dart';
import 'package:real_estate_app_new/custom_widgets.dart';

class LoginFaq extends StatefulWidget {
  const LoginFaq({super.key});

  @override
  State<LoginFaq> createState() => _LoginFaqState();
}

class _LoginFaqState extends State<LoginFaq> {
  final tabColor = Colors.white;
  bool answer1Vsible = false;
  bool answer2Vsible = false;
  TextEditingController controller = TextEditingController();
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                        text: 'FAQ ',
                        style: GoogleFonts.raleway(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                          color: const Color(0xff252B5C),
                        ),
                      ),
                      TextSpan(
                        text: "& ",
                        style: GoogleFonts.lato(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff1F4C6B),
                        ),
                      ),
                      TextSpan(
                        text: 'Support ',
                        style: GoogleFonts.raleway(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                          color: const Color(0xff252B5C),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  'Find answer to your problem using this app.',
                  style: GoogleFonts.lato(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff53587A),
                  ),
                ),
                const SizedBox(height: 40),
                faqListItem(FontAwesomeIcons.globe, 'Visit our website'),
                const Divider(thickness: 1.5),
                faqListItem(Icons.email_outlined, 'Email us'),
                const Divider(thickness: 1.5),
                faqListItem(Icons.edit_document, "Terms of service"),
                const SizedBox(height: 25),
                CustomTextField(
                  isReadOnly: false,
                  controller: controller,
                  hint: "Try find 'how to'",
                  icon: Icons.search,
                  isObscure: false,
                ),
                const SizedBox(height: 25),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xffF5F4F8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: tabButton(
                          'Buyer',
                          () {
                            pageController.animateTo(
                              1,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: tabButton('Estate Agent', () {
                          pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        }),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 350,
                  child: PageView(
                    controller: pageController,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 15),
                        alignment: Alignment.topLeft,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              question(
                                'What is Rise Real Estate?',
                                () {
                                  setState(() {
                                    answer1Vsible = !answer1Vsible;
                                  });
                                },
                                answer1Vsible == false ? Icons.add : Icons.minimize,
                              ),
                              Visibility(
                                visible: answer1Vsible,
                                child: answer(),
                              ),
                              question(
                                'Why buy in rise?',
                                () {
                                  setState(() {
                                    answer2Vsible = !answer2Vsible;
                                  });
                                },
                                answer2Vsible == false ? Icons.add : Icons.minimize,
                              ),
                              Visibility(
                                visible: answer2Vsible,
                                child: answer(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.red,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  InkWell tabButton(String text, dynamic onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 32,
        decoration: BoxDecoration(
          color: tabColor,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.raleway(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: const Color(0xff252B5C),
            ),
          ),
        ),
      ),
    );
  }

  faqListItem(IconData icon, String text) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: const Color(0xff252B5C),
                child: FaIcon(
                  icon,
                  color: Colors.white,
                  size: 15,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                text,
                style: GoogleFonts.lato(
                  color: const Color(0xff252B5C),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  question(String text, dynamic onTap, IconData iconData) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Text(
            text,
            style: GoogleFonts.lato(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: const Color(0xff252B5C),
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: onTap,
            child: Icon(
              iconData,
              color: const Color(0xff8BC83D),
            ),
          )
        ],
      ),
    );
  }

  answer() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xffF5F4F8),
      ),
      child: Text(
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut. aliquip ex ea commodo consequat. Duis aute irure dolor.",
        style: GoogleFonts.lato(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: const Color(0xff53587A),
        ),
      ),
    );
  }
}
