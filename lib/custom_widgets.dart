import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Utils/navigation.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onTap,
  });

  final String text;
  final dynamic onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 54,
        width: 190,
        decoration: BoxDecoration(
          color: const Color(0xff8BC83F),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.lato(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    this.hint,
    this.icon,
    this.onTap,
    this.isObscure,
    required this.isReadOnly,
    required this.controller,
    this.validator,
    this.autovalidateMode,
  });

  final String? hint;
  final IconData? icon;
  final dynamic onTap;
  bool isReadOnly;
  bool? isObscure;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final AutovalidateMode? autovalidateMode;

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   padding: const EdgeInsets.symmetric(horizontal: 15),
    //   height: 70,
    //   decoration: BoxDecoration(
    //     // color: const Color(0xffF5F4F8),
    //     borderRadius: BorderRadius.circular(10),
    //   ),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Icon(
    //         icon,
    //         color: const Color(0xff252B5C),
    //       ),
    //       const SizedBox(width: 8),
    //       Flexible(
    //         child:
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      cursorColor: const Color(0xff252B5C),
      obscureText: isObscure!,
      controller: controller,
      onTap: onTap,
      readOnly: isReadOnly,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0xffF5F4F8),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0xff8BC83F),
          ),
        ),
        prefixIcon: Icon(
          icon,
          color: const Color(0xff252B5C),
        ),
        border: InputBorder.none,
        hintText: hint,
        helperStyle: GoogleFonts.raleway(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: const Color(0xffA1A5C1),
        ),
      ),
    );
    // )
    //     ],
    //   ),
    // );
  }
}

class CustomBigBtn extends StatelessWidget {
  const CustomBigBtn({
    super.key,
    required this.child,
    this.onTap,
  });

  final dynamic onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        width: 278,
        decoration: BoxDecoration(
          color: const Color(0xff8BC83F),
          borderRadius: BorderRadius.circular(10),
        ),
        child: child,
      ),
    );
  }
}

class BackBtn extends StatelessWidget {
  const BackBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
    );
  }
}
