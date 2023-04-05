import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_app_new/Screens/Authentication/SignUp/user_fill_infomation.dart';
import 'package:real_estate_app_new/Screens/BasePage/base_page.dart';
import 'package:real_estate_app_new/Utils/navigation.dart';
import 'package:real_estate_app_new/custom_widgets.dart';

class AddPaymentMethod extends StatefulWidget {
  const AddPaymentMethod({Key? key}) : super(key: key);
  @override
  State<AddPaymentMethod> createState() => _AddPaymentMethodState();
}

class _AddPaymentMethodState extends State<AddPaymentMethod> {
  TextEditingController fullName = TextEditingController();
  TextEditingController cardNumber = TextEditingController();
  TextEditingController expDate = TextEditingController();
  TextEditingController cvv = TextEditingController();
  bool paypal = true;
  bool mastercard = false;
  bool visa = false;
  Color selectedColor = const Color(0xff252B5C);
  Color unselectedColor = const Color(0xffF5F4F8);
  final PageController pageController = PageController();
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
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Add your',
                              style: GoogleFonts.raleway(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff252B5C),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'payment method',
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
                          ],
                        ),
                      ),
                      Center(
                          child: Image.asset(
                        'images/atm.png',
                        fit: BoxFit.fitWidth,
                      )), // const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              buildPaymentMethod(
                                "Paypal",
                                () {
                                  pageController.jumpToPage(0);
                                  if (mastercard == true || visa == true) {
                                    setState(() {
                                      mastercard = false;
                                      visa = false;
                                      paypal = true;
                                    });
                                  } else {
                                    setState(() {
                                      paypal = true;
                                    });
                                  }
                                },
                                paypal ? selectedColor : unselectedColor,
                                paypal ? Image.asset("images/paypal.png") : Image.asset("images/paypals.png"),
                                paypal ? Colors.white : const Color(0xff53587A),
                              ),
                              const SizedBox(width: 10),
                              buildPaymentMethod(
                                "Mastercard",
                                () {
                                  pageController.jumpToPage(1);
                                  if (paypal == true || visa == true) {
                                    setState(() {
                                      paypal = false;
                                      visa = false;
                                      mastercard = true;
                                    });
                                  } else {
                                    setState(() {
                                      mastercard = true;
                                    });
                                  }
                                },
                                mastercard ? selectedColor : unselectedColor,
                                mastercard ? Image.asset("images/mastercard.png") : Image.asset("images/mastercard.png"),
                                mastercard ? Colors.white : const Color(0xff53587A),
                              ),
                              const SizedBox(width: 10),
                              buildPaymentMethod(
                                "Visa",
                                () {
                                  if (paypal == true || mastercard == true) {
                                    setState(() {
                                      paypal = false;
                                      mastercard = false;
                                      visa = true;
                                    });
                                  } else {
                                    setState(() {
                                      visa = true;
                                    });
                                  }
                                },
                                visa ? selectedColor : unselectedColor,
                                visa ? Image.asset("images/visa.png") : Image.asset("images/visa.png"),
                                visa ? Colors.white : const Color(0xff53587A),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                          height: 350,
                          child: PageView(
                            physics: NeverScrollableScrollPhysics(),
                            controller: pageController,
                            children: [
                              Paypal(fullName: fullName, email: cardNumber),
                              MasterCardForm(
                                fullName: fullName,
                                cardNumber: cardNumber,
                                expDate: expDate,
                                cvv: cvv,
                              ),
                            ],
                          )),
                      const SizedBox(height: 30)
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Widget buildPaymentMethod(
    String text,
    VoidCallback onTap,
    Color backGroundColor,
    Widget child,
    Color textColor,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        height: 50,
        decoration: BoxDecoration(
          color: backGroundColor,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Row(
            children: [
              child,
              const SizedBox(width: 15),
              Text(
                text,
                style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w700,
                  fontSize: 10,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Paypal extends StatelessWidget {
  const Paypal({
    super.key,
    required this.fullName,
    required this.email,
  });
  final TextEditingController fullName;
  final TextEditingController email;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          CustomTextField(
            isReadOnly: false,
            controller: fullName,
            isObscure: false,
            hint: "Full name",
            icon: Icons.person,
          ),
          const SizedBox(height: 20),
          CustomTextField(
            isReadOnly: false,
            controller: email,
            isObscure: false,
            hint: "Email address",
            icon: Icons.email_outlined,
          ),
          const SizedBox(height: 30),
          Align(
            alignment: Alignment.bottomCenter,
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
                nextPage(
                  context,
                  const FillInformation(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MasterCardForm extends StatelessWidget {
  const MasterCardForm({
    super.key,
    required this.fullName,
    required this.cardNumber,
    required this.expDate,
    required this.cvv,
  });
  final TextEditingController fullName;
  final TextEditingController cardNumber;
  final TextEditingController expDate;
  final TextEditingController cvv;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          CustomTextField(
            isReadOnly: false,
            controller: fullName,
            isObscure: false,
            hint: "Full name",
            icon: Icons.person_outlined,
          ),
          const SizedBox(height: 20),
          CustomTextField(
            isReadOnly: false,
            controller: cardNumber,
            isObscure: false,
            hint: "card number",
            icon: Icons.credit_card_outlined,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  isReadOnly: false,
                  controller: expDate,
                  isObscure: false,
                  hint: "expiry date",
                  icon: Icons.calendar_month_outlined,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: CustomTextField(
                  isReadOnly: false,
                  controller: cvv,
                  isObscure: false,
                  hint: "cvv",
                  icon: Icons.credit_card_outlined,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Align(
            alignment: Alignment.bottomCenter,
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
                nextPage(
                  context,
                  const FillInformation(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
