import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:real_estate_app_new/Screens/BasePage/base_page.dart';
import 'package:real_estate_app_new/Utils/app_bar.dart';
import 'package:real_estate_app_new/Utils/navigation.dart';
import 'package:real_estate_app_new/custom_widgets.dart';

class FillInformation extends StatefulWidget {
  const FillInformation({Key? key}) : super(key: key);
  @override
  State<FillInformation> createState() => _FillInformationState();
}

class _FillInformationState extends State<FillInformation> {
  TextEditingController fullname = TextEditingController();
  TextEditingController phone = TextEditingController();

  File? imageFile;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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
                            text: 'Fill your ',
                            style: GoogleFonts.raleway(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff252B5C),
                            ),
                          ),
                          TextSpan(
                            text: 'information ',
                            style: GoogleFonts.raleway(
                              fontSize: 25,
                              fontWeight: FontWeight.w800,
                              color: const Color(0xff252B5C),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'below ',
                      style: GoogleFonts.raleway(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff252B5C),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Text(
                      'You can edit this later on your account setting. ',
                      style: GoogleFonts.dmSans(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff252B5C),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 70,
                            backgroundColor: const Color(0xffF5F4F8),
                            backgroundImage: imageFile == null
                                ? null
                                : FileImage(imageFile!),
                            child: imageFile == null
                                ? Icon(
                                    Icons.person,
                                    size: 80,
                                    color: Colors.grey.shade400,
                                  )
                                : null,
                          ),
                          Positioned(
                            bottom: 10,
                            right: 10,
                            child: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
                                  context: context,
                                  builder: (context) {
                                    return bottomSheet();
                                  },
                                );
                              },
                              child: const CircleAvatar(
                                radius: 17,
                                backgroundColor: Color(0xff234F68),
                                child: Icon(
                                  Icons.edit_outlined,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    CustomTextField(
                      hint: "Full name",
                      isReadOnly: false,
                      controller: fullname,
                      isObscure: false,
                      icon: Icons.person,
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      hint: "Phone number",
                      isReadOnly: false,
                      controller: phone,
                      isObscure: false,
                      icon: Icons.phone,
                    ),
                    const SizedBox(height: 15),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      height: 70,
                      decoration: BoxDecoration(
                        color: const Color(0xff234F68),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            Text(
                              'jonathan@email.com',
                              style: GoogleFonts.raleway(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.email_outlined,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 35),
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
                          showModalBottomSheet(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40),
                              ),
                            ),
                            context: context,
                            builder: (context) {
                              return sucessModalSheet();
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  setImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    setState(() {
      imageFile = File(pickedFile!.path);
    });
  }

  Widget bottomSheet() {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
      height: 150,
      decoration: const BoxDecoration(),
      child: Column(
        children: [
          Text(
            "Choose image from:",
            style: GoogleFonts.raleway(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: const Color(0xff252B5C)),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  setImage(ImageSource.camera);
                  Navigator.pop(context);
                },
                child: Column(
                  children: [
                    const Icon(
                      Icons.camera_alt_outlined,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Camera",
                      style: GoogleFonts.raleway(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff252B5C)),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 60),
              InkWell(
                onTap: () {
                  setImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
                child: Column(
                  children: [
                    const Icon(
                      Icons.image,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Galery",
                      style: GoogleFonts.raleway(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff252B5C)),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget sucessModalSheet() {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Container(
            height: 5,
            width: 70,
            decoration: BoxDecoration(
              color: const Color(0xff53587A),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(height: 15),
          Image.asset("images/alert_success.png"),
          const SizedBox(height: 20),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Account ',
                  style: GoogleFonts.raleway(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff252B5C),
                  ),
                ),
                TextSpan(
                  text: 'Successfully ',
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
            'Created',
            style: GoogleFonts.raleway(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: const Color(0xff252B5C),
            ),
          ),
          const SizedBox(height: 30),
          Text(
            'Welldone! your account has been created successfully.',
            style: GoogleFonts.dmSans(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: const Color(0xff252B5C),
            ),
          ),
          const SizedBox(height: 40),
          CustomBigBtn(
            child: Center(
              child: Text(
                'Finish',
                style: GoogleFonts.lato(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
            onTap: () {
              nextPage(
                context,
                const BasePage(),
              );
            },
          ),
        ],
      ),
    );
  }
}
