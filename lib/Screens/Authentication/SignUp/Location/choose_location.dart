import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:real_estate_app_new/Screens/Authentication/SignUp/estate_pref1.dart';

import '../../../../Utils/navigation.dart';
import '../../../../custom_widgets.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  Completer<GoogleMapController> _controller = Completer();
  CameraPosition? initialPosition;
  static const CameraPosition targetPosition = CameraPosition(target: LatLng(33.1354, -350.7653), zoom: 14.0, bearing: 192.0, tilt: 60);

  @override
  void initState() {
    initialPosition = const CameraPosition(
      target: LatLng(6.605407, 3.279887),
      zoom: 14.0,
      bearing: 192.0,
      tilt: 60,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              zoomControlsEnabled: false,
              initialCameraPosition: initialPosition!,
              mapType: MapType.normal,
              onMapCreated: (controller) {
                _controller.complete(controller);
              },
            ),
            Column(
              children: [
                const SizedBox(height: 89),
                Center(
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                      top: 15,
                      bottom: 15,
                    ),
                    height: 70,
                    width: 327,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black45,
                          blurRadius: 30,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(
                          Icons.search,
                          color: Color(0xff252B5C),
                        ),
                        SizedBox(width: 5),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 5),
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Find Location',
                              ),
                            ),
                          ),
                        ),
                        VerticalDivider(thickness: 1.5),
                        SizedBox(width: 5),
                        Icon(
                          Icons.mic_none_outlined,
                          color: Color(0xffA1A5C1),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 350),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                  height: 133,
                  width: 327,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 40,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Location Detail',
                        style: GoogleFonts.lato(
                          color: const Color(0xff252B5C),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: const [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: Color(0xffECEDF3),
                            child: Icon(
                              Icons.location_on_outlined,
                              color: Color(0xff53587A),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Srengseng, Kembangan, West Jakarta City, Jakarta 11630',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: CustomBigBtn(
                    child: Center(
                      child: Text(
                        'Choose your Location',
                        style: GoogleFonts.lato(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onTap: () {
                      // nextPage(
                      //   context,
                      //   const ChooseLocation(),
                      // );
                      showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25),
                            topLeft: Radius.circular(25),
                          ),
                        ),
                        context: context,
                        builder: (context) {
                          return Container(
                            padding: const EdgeInsets.only(left: 20, top: 25, right: 20),
                            height: 300,
                            color: Colors.white,
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: InkWell(
                                    child: const Icon(Icons.close),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                                const SizedBox(height: 30),
                                const Text(
                                  'Your Location is: Egbeda local Govt.',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 100),
                                CustomBigBtn(
                                  child: const Center(
                                    child: Text(
                                      'Proceed',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    nextPage(context, const EstatePref1());
                                  },
                                )
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
