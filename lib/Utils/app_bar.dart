import 'package:flutter/material.dart';
import 'package:real_estate_app_new/Utils/navigation.dart';

appBar(BuildContext context, Widget page, leading) {
  return Container(
    padding: const EdgeInsets.only(right: 20, left: 10),
    color: Colors.white,
    height: 80,
    width: MediaQuery.of(context).size.width,
    child: Align(
      alignment: Alignment.center,
      child: Row(
        children: [
          leading,
          const Spacer(),
          GestureDetector(
            onTap: () {
              nextPage(context, page);
            },
            child: Container(
              height: 38,
              width: 86,
              decoration: BoxDecoration(
                color: const Color(0xffDFDFDF),
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Center(
                child: Text('Skip'),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
