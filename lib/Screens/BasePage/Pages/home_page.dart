import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_app_new/Models/category_model.dart';
import 'package:real_estate_app_new/Theme/app_colors.dart';
import 'package:real_estate_app_new/Utils/app_colors.dart';
import 'package:real_estate_app_new/custom_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController? pageController;
  TextEditingController searchController = TextEditingController();
  Color selectedColorForCat = kDarkBlue;
  Color unSelectedColorForCat = kGrey;
  bool catSelected = true;
  int currentCategory = 0;

  @override
  void initState() {
    pageController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
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

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(AppColor.secondaryColor),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: DefaultTabController(
                    length: 4,
                    child: TabBar(
                      indicatorPadding: EdgeInsets.zero,
                      controller: pageController,
                      indicatorColor: const Color(AppColor.primaryColor),
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(AppColor.primaryColor),
                      ),
                      unselectedLabelColor: const Color(AppColor.primaryColor),
                      tabs: const [
                        Tab(text: "all"),
                        Tab(text: "Home"),
                        Tab(text: "Apartment"),
                        Tab(text: "House")
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),

              DefaultTabController(
                length: 4,
                child: SizedBox(
                  width: double.maxFinite,
                  height: 200,
                  child: TabBarView(
                    controller: pageController,
                    children: [
                      categoryListChildren(),
                      categoryListChildren(),
                      categoryListChildren(),
                      categoryListChildren(),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      "Featured Estates",
                      style: GoogleFonts.lato(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: const Color(AppColor.primaryColor),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "View all",
                      style: GoogleFonts.lato(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: const Color(AppColor.primaryColor),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: SizedBox(
                  height: 156,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    controller: ScrollController(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      featuredEstateWidget(),
                      const SizedBox(width: 10),
                      featuredEstateWidget(),
                      const SizedBox(width: 10),
                      featuredEstateWidget(),
                      const SizedBox(width: 10),
                      featuredEstateWidget(),
                      const SizedBox(width: 10),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      "Top Locations",
                      style: GoogleFonts.lato(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: const Color(AppColor.primaryColor),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "explore",
                      style: GoogleFonts.lato(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: const Color(AppColor.primaryColor),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: SizedBox(
                  height: 57,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      topLocationsWidget(),
                      topLocationsWidget(),
                      topLocationsWidget(),
                      topLocationsWidget(),
                    ],
                  ),
                ),
              )
              // SizedBox(
              //   height: 47,
              //   child: CategoryList(
              //     onChanged: (int value) {
              //       setState(() {
              //         currentCategory = value;
              //       });
              //     },
              //   ),
              // ),
              // Text(category[currentCategory].name!)
              // PageView.builder(itemBuilder: (context, index)=> Text(category[index].name!),)
            ],
          ),
        ),
      ),
    );
  }

  Container topLocationsWidget() {
    return Container(
      height: 56,
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
      decoration: BoxDecoration(
        color: const Color(AppColor.secondaryColor),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(100),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('images/bali.png'),
                ),
              ),
            ),
            Text(
              "Bali",
              style: GoogleFonts.raleway(
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget featuredEstateWidget() {
    return Container(
      padding: const EdgeInsets.only(
        left: 10,
        top: 10,
        bottom: 10,
        right: 20,
      ),
      height: 156,
      // width: 268,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: const Color(AppColor.secondaryColor),
      ),
      child: Row(
        children: [
          Container(
            height: 140,
            width: 134,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: const DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("images/3.png"),
              ),
            ),
            child: Stack(
              children: [
                const Positioned(
                  left: 10,
                  top: 10,
                  child: CircleAvatar(
                    backgroundColor: Color(AppColor.appGreen),
                    radius: 12,
                    child: Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 12,
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  bottom: 10,
                  child: Container(
                    padding: const EdgeInsets.all(7),
                    height: 27,
                    decoration: BoxDecoration(
                      color: const Color(AppColor.primaryColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        "Apartment",
                        style: GoogleFonts.raleway(
                          fontSize: 8,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sky Dandetions Apartment",
                style: GoogleFonts.raleway(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: const Color(AppColor.primaryColor),
                ),
                overflow: TextOverflow.clip,
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Color(AppColor.primaryColor),
                    size: 12,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "Jakarta, Indonesia",
                    style: GoogleFonts.raleway(
                      fontSize: 8,
                      fontWeight: FontWeight.w400,
                      color: const Color(AppColor.primaryColor),
                    ),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: r"$ 290",
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color(AppColor.primaryColor),
                      ),
                    ),
                    TextSpan(
                      text: "/month",
                      style: GoogleFonts.montserrat(
                        fontSize: 8,
                        fontWeight: FontWeight.w500,
                        color: const Color(AppColor.primaryColor),
                      ),
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

  ListView categoryListChildren() {
    return ListView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      controller: ScrollController(),
      children: [
        categoryChildWidget(),
        categoryChildWidget(),
        categoryChildWidget(),
      ],
    );
  }

  Widget categoryChildWidget() {
    return Container(
      width: 300,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      height: 180,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
        ),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("images/haloween.png"),
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 30),
            child: Column(
              children: [
                Text(
                  "Halloween \nSale!",
                  style: GoogleFonts.raleway(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 15),
                Text(
                  "All discount up to 60%",
                  style: GoogleFonts.raleway(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: 56,
              width: 93,
              decoration: const BoxDecoration(
                color: Color(AppColor.primaryColor),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                ),
              ),
              child: const Center(
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
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
