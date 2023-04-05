import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_app_new/Models/category_model.dart';
import 'package:real_estate_app_new/Theme/app_colors.dart';
import 'package:real_estate_app_new/custom_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  Color selectedColorForCat = kDarkBlue;
  Color unSelectedColorForCat = kGrey;
  bool catSelected = true;
  int currentCategory = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getTopBar(),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Hey, ',
                        style: GoogleFonts.raleway(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff252B5C),
                        ),
                      ),
                      TextSpan(
                        text: 'Chima! ',
                        style: GoogleFonts.raleway(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                          color: const Color(0xff252B5C),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "Let's start exploring",
                  style: GoogleFonts.raleway(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff252B5C),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: CustomTextField(
                  isReadOnly: false,
                  controller: searchController,
                  icon: Icons.search_rounded,
                  isObscure: false,
                  hint: "Search House, Apartment etc",
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 47,
                child: CategoryList(
                  onChanged: (int value) {
                    setState(() {
                      currentCategory = value;
                    });
                  },
                ),
              ),
              Text(category[currentCategory].name!)
              // PageView.builder(itemBuilder: (context, index)=> Text(category[index].name!),)
            ],
          ),
        ),
      ),
    );
  }

  Widget getTopBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xffECEDF3),
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(
                  Icons.location_on_rounded,
                  color: kDarkBlue,
                ),
                SizedBox(width: 8),
                Text("Jakarta, Indonesia"),
                SizedBox(width: 8),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: kDarkBlue,
                ),
              ],
            ),
          ),
          const Spacer(),
          Image.asset(
            "images/Notification.png",
          ),
          const SizedBox(width: 15),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              border: Border.all(
                color: kDarkBlue,
              ),
              shape: BoxShape.circle,
              image: const DecorationImage(
                image: AssetImage("images/chima.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CategoryList extends StatefulWidget {
  final Function(int) onChanged;
  const CategoryList({super.key, required this.onChanged});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(left: 20),
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      controller: ScrollController(),
      itemCount: category.length,
      itemBuilder: (context, index) {
        var data = category[index];
        return InkWell(
          onTap: () {
            setState(() {
              selectedCategory = index;
            });
            widget.onChanged(index);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 18,
            ),
            margin: const EdgeInsets.only(right: 10),
            height: 47,
            decoration: BoxDecoration(
              color: index == selectedCategory ? kDarkBlue : kGrey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              data.name!,
              style: GoogleFonts.raleway(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: index == selectedCategory ? Colors.white : Colors.black,
              ),
            ),
          ),
        );
      },
    );
  }
}
