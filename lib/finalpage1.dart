import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sujal_project/api/rest_client.dart';
import 'package:sujal_project/beachmodel.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

class Finalpage1 extends StatefulWidget {
  // String? beatch_name;
  // String? photo;
  // String? price;
  // String? description;
  // String? location;

  int? idd;

  Finalpage1({
    Key? key,
    required this.idd,

  }) : super(key: key);

  @override
  State<Finalpage1> createState() => _Finalpage1State();
}

class _Finalpage1State extends State<Finalpage1> {
  bool des_rev_button = true;
  bool des_rev_button_color = true;
  List<Beachmodel> beachList = [];

  Future<List<Beachmodel>> getdata() async {
    final dio = Dio(); // Provide a dio instance
    dio.options.headers["Demo-Header"] =
        "demo header"; // config your dio headers globally
    final client = RestClient(dio);
    var data = jsonDecode(await client.getData());
    print(data.toString());
    for (Map i in data) {
      beachList.add(Beachmodel.fromJson(i));
    }

    return beachList;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return Scaffold(
        body: SafeArea(
          child: FutureBuilder<List<Beachmodel>>(
            future: getdata(),
            builder: (context, snapshot) {
              if (snapshot.hasData != null && snapshot.hasData) {
                return Column(
                  children: [
                    Expanded(
                      flex: 10,
                      child: Stack(
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  height: 50.h,
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      Image.asset(
                                        "assets/img/beatch1.jpg",
                                        fit: BoxFit.cover,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                            colors: [
                                              Colors.white,
                                              Colors.transparent,
                                            ],
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.center,
                                            stops: [-1, 1],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 1.h, horizontal: 6.w),
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Colors.white,
                                        Colors.transparent,
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.topCenter,
                                      stops: [0.8, 1],
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                              flex: 4,
                                              child: Text(
                                                beachList[int.parse(
                                                        widget.idd.toString())]
                                                    .beachName
                                                    .toString(),
                                                style: TextStyle(
                                                    fontFamily: "google2",
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 21.sp),
                                              )),
                                          // SizedBox(
                                          //   width: 5.w,
                                          // ),
                                          Expanded(
                                              flex: 3,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    "\$" +
                                                        beachList[int.parse(
                                                                widget.idd
                                                                    .toString())]
                                                            .price
                                                            .toString(),
                                                    style: TextStyle(
                                                        fontFamily: "google2",
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18.sp),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        top: 1.h),
                                                    child: Text(
                                                      "/ person",
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontFamily: "google2",
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14.sp),
                                                    ),
                                                  ),
                                                ],
                                              )),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_searching,
                                            color: Colors.grey,
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Text(
                                            beachList[int.parse(
                                                    widget.idd.toString())]
                                                .location
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                fontFamily: "google2",
                                                color: Colors.grey),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Container(
                                        height: 6.h,
                                        child: ListView(
                                          scrollDirection: Axis.horizontal,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  height: 6.h,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    child: ElevatedButton.icon(
                                                      onPressed: () {},
                                                      icon: Icon(
// <-- Icon
                                                        Icons
                                                            .access_time_rounded,
                                                        size: 18.sp,
                                                        color: Colors.grey,
                                                      ),
                                                      label: Text('3 Days',
                                                          style: TextStyle(
                                                              fontSize: 15.sp,
                                                              color:
                                                                  Colors.grey)),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              shadowColor:
                                                                  Colors.white,
                                                              primary: Colors
                                                                  .white70,
                                                              foregroundColor:
                                                                  Colors
                                                                      .white70),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 2.w,
                                                ),
                                                Container(
                                                  height: 6.h,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    child: ElevatedButton.icon(
                                                      onPressed: () {},
                                                      icon: Icon(
// <-- Icon
                                                        Icons.star_border,
                                                        size: 18.sp,
                                                        color: Colors.grey,
                                                      ),
                                                      label: Text(
                                                          '4.5 Rattings',
                                                          style: TextStyle(
                                                              fontSize: 15.sp,
                                                              color:
                                                                  Colors.grey)),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              shadowColor:
                                                                  Colors.white,
                                                              primary: Colors
                                                                  .white70,
                                                              foregroundColor:
                                                                  Colors
                                                                      .white70),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 2.w,
                                                ),
                                                Container(
                                                  height: 6.h,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    child: ElevatedButton.icon(
                                                      onPressed: () {},
                                                      icon: Icon(
// <-- Icon
                                                        Icons.person_add_alt,
                                                        size: 18.sp,
                                                        color: Colors.grey,
                                                      ),
                                                      label: Text('With Guide',
                                                          style: TextStyle(
                                                              fontSize: 15.sp,
                                                              color:
                                                                  Colors.grey)),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              shadowColor:
                                                                  Colors.white,
                                                              primary: Colors
                                                                  .white70,
                                                              foregroundColor:
                                                                  Colors
                                                                      .white70),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            height: 6.h,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  des_rev_button = true;
                                                  des_rev_button_color = true;
                                                });
                                              },
                                              child: Text('Description',
                                                  style: TextStyle(
                                                      fontFamily: "google2",
                                                      fontSize: 18.sp,
                                                      color:
                                                          des_rev_button_color
                                                              ? Colors.blue
                                                              : Colors.grey)),
                                              style: ElevatedButton.styleFrom(
                                                  elevation: 0,
                                                  shadowColor: Colors.white,
                                                  primary: Colors.white70,
                                                  foregroundColor:
                                                      Colors.white70),
                                            ),
                                          ),
                                          Container(
                                            height: 6.h,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  des_rev_button = false;
                                                  des_rev_button_color = false;
                                                });
                                              },
                                              child: Text('Review',
                                                  style: TextStyle(
                                                      fontFamily: "google2",
                                                      fontSize: 18.sp,
                                                      color:
                                                          des_rev_button_color
                                                              ? Colors.grey
                                                              : Colors.blue)),
                                              style: ElevatedButton.styleFrom(
                                                  elevation: 0,
                                                  shadowColor: Colors.white,
                                                  primary: Colors.white70,
                                                  foregroundColor:
                                                      Colors.white70),
                                            ),
                                          ),
                                        ],
                                      ),
                                      des_rev_button
                                          ? SingleChildScrollView(
                                              child: Container(
                                                  child: Text(
                                                beachList[int.parse(
                                                        widget.idd.toString())]
                                                    .description
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: "google2",
                                                    fontSize: 18.sp),
                                              )),
                                            )
                                          : Text("review"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 6.h,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        Colors.white.withOpacity(0.3),
                                        Colors.white
                                      ],
                                      begin: Alignment.center,
                                      end: Alignment.bottomCenter,
                                      stops: [-4, 7])),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.fromLTRB(6.w, 0, 6.w, 1.5.h),
                        height: 6.h,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text('Book Now',
                                style: TextStyle(
                                    fontFamily: "google2",
                                    fontSize: 18.sp,
                                    color: Colors.white)),
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                shadowColor: Colors.white,
                                primary: Colors.blue,
                                foregroundColor: Colors.white70),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      );
    });
  }
}

// return Column(children: [
//   Container(
//     height: 60.h,
//     decoration: BoxDecoration(
//         gradient: const LinearGradient(
//             colors: [
//               Colors.white,
//               Colors.transparent,
//             ],
//             begin: Alignment.bottomCenter,
//             end: Alignment.center),
//         color: Colors.transparent),
//     child: Stack(
//       fit: StackFit.expand,
//       children: [
//         Image.asset(
//           "assets/img/beatch1.jpg",
//           fit: BoxFit.cover,
//         ),
//         Container(
//           decoration: BoxDecoration(
//             gradient: const LinearGradient(
//               colors: [
//                 Colors.white,
//                 Colors.transparent,
//               ],
//               begin: Alignment.bottomCenter,
//               end: Alignment.center,
//               stops: [-1, 1],
//             ),
//           ),
//         ),
//       ],
//     ),
//   ),
// ]);
