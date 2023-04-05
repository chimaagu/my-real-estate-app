import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_app_new/Screens/Authentication/SignUp/payment_method.dart';
import 'package:real_estate_app_new/Screens/BasePage/base_page.dart';
import 'package:real_estate_app_new/Utils/navigation.dart';
import 'package:real_estate_app_new/custom_widgets.dart';

class EstatePref2 extends StatefulWidget {
  const EstatePref2({Key? key}) : super(key: key);
  @override
  State<EstatePref2> createState() => _EstatePref2State();
}

class _EstatePref2State extends State<EstatePref2> {
  final selectedColor = const Color(0xff1F4C6B);
  final unSelectedColor = const Color(0xffF5F4F8);
  bool isApartment = false;
  bool isVilla = false;
  bool isHouse = false;
  bool isCottage = false;
  bool isHotel = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
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
                        const SizedBox(height: 30),
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
                        GridView(
                          controller: ScrollController(),
                          shrinkWrap: true,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 15,
                          ),
                          children: [
                            Estatetype(
                              isChecked: isApartment,
                              name: "Apartment",
                              image: "apartment",
                              onTap: () {
                                setState(() {
                                  isApartment = !isApartment;
                                });
                              },
                              backGroundColor: isApartment ? selectedColor : unSelectedColor,
                            ),
                            Estatetype(
                              isChecked: isVilla,
                              name: "villa",
                              image: "villa",
                              onTap: () {
                                setState(() {
                                  isVilla = !isVilla;
                                });
                              },
                              backGroundColor: isVilla ? selectedColor : unSelectedColor,
                            ),
                            Estatetype(
                              isChecked: isHouse,
                              name: "House",
                              image: "house",
                              onTap: () {
                                setState(() {
                                  isHouse = !isHouse;
                                });
                              },
                              backGroundColor: isHouse ? selectedColor : unSelectedColor,
                            ),
                            Estatetype(
                              isChecked: isCottage,
                              image: "cottage",
                              name: "Cottage",
                              onTap: () {
                                setState(() {
                                  isCottage = !isCottage;
                                });
                              },
                              backGroundColor: isCottage ? selectedColor : unSelectedColor,
                            ),
                            Estatetype(
                              isChecked: isHotel,
                              image: "4",
                              name: "Hotel",
                              onTap: () {
                                setState(() {
                                  isHotel = !isHotel;
                                });
                              },
                              backGroundColor: isHotel ? selectedColor : unSelectedColor,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
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
                        'Next',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onTap: () {
                      nextPage(context, const AddPaymentMethod());
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

class Estatetype extends StatelessWidget {
  Estatetype({
    super.key,
    this.backGroundColor,
    this.onTap,
    required this.name,
    this.image,
    required this.isChecked,
  });
  final Color? backGroundColor;
  final VoidCallback? onTap;
  final String name;
  final String? image;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: backGroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('images/$image.png'),
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: isChecked ? Image.asset('images/checked.png') : Image.asset('images/unchecked.png'),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                name,
                style: GoogleFonts.lato(fontWeight: FontWeight.w700, fontSize: 12, color: isChecked ? Colors.white : const Color(0xff1F4C6B)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
