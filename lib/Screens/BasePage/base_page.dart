import "package:flutter/material.dart";
import "package:real_estate_app_new/Screens/BasePage/Pages/home_page.dart";
import "package:real_estate_app_new/Theme/app_colors.dart";

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int selectedIndex = 0;
  List<Widget> screens = [
    HomePage(),
    Container(color: Colors.green),
    Container(color: Colors.amber),
    Container(color: Colors.blue),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        IndexedStack(
          index: selectedIndex,
          children: screens,
        )
      ]),
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(
            () {
              selectedIndex = value;
            },
          );
        },
        currentIndex: selectedIndex,
        selectedItemColor: kDarkBlue,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "",
            activeIcon: Image.asset('images/homeicon.png'),
          ),
          BottomNavigationBarItem(
            icon: Image.asset("images/Zoom.png"),
            label: "",
            activeIcon: Image.asset("images/Zoom.png"),
          ),
          BottomNavigationBarItem(
            icon: Image.asset("images/Heart.png"),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("images/Profile.png"),
            label: "",
          )
        ],
      ),
    );
  }
}
