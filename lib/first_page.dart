import 'dart:convert';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:logger/logger.dart';
import 'package:dio/dio.dart';
import 'package:sujal_project/api/rest_client.dart';
import 'package:sujal_project/api_data.dart';
import 'package:sujal_project/beachmodel.dart';

// import 'package:sujal_project/finalpage.dart';
import 'package:sujal_project/finalpage1.dart';

class first_page extends StatefulWidget {
  @override
  State<first_page> createState() => _first_pageState();
}

class _first_pageState extends State<first_page> {
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

  final navigationKey = GlobalKey<CurvedNavigationBarState>();

  int index = 1;

  final screens = [];

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      var h;
      var w;
      return Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Hi,Brodeen!\nWhere are you going ?",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(width: 0.5),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Icon(
                                Icons.notifications_none,
                              ),
                            )),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 8, left: 15, right: 15),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 0.10)),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.search),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Search Your Location",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //  Container for Button ####################################################
                  Container(
                    height: 10.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 2.h, horizontal: 4.w),
                                margin: EdgeInsets.fromLTRB(3.w, 1.h, 1.h, 1.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color.fromARGB(255, 23, 12, 232),
                                ),
                                child: const Text("All",
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ),
                            InkWell(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 2.h, horizontal: 4.w),
                                margin: EdgeInsets.symmetric(horizontal: 1.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.shade200,
                                ),
                                child: const Text("Beach",
                                    style: TextStyle(color: Colors.grey)),
                              ),
                            ),
                            InkWell(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 2.h, horizontal: 4.w),
                                margin: EdgeInsets.all(1.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.shade200,
                                ),
                                child: const Text("Movie",
                                    style: TextStyle(color: Colors.grey)),
                              ),
                            ),
                            InkWell(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 2.h, horizontal: 4.w),
                                margin: EdgeInsets.all(1.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.shade200,
                                ),
                                child: const Text("Ilend",
                                    style: TextStyle(color: Colors.grey)),
                              ),
                            ),
                            InkWell(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 2.h, horizontal: 4.w),
                                margin: EdgeInsets.all(1.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.shade200,
                                ),
                                child: const Text("Mountain",
                                    style: TextStyle(color: Colors.grey)),
                              ),
                            ),
                            InkWell(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 2.h, horizontal: 4.w),
                                margin: EdgeInsets.all(1.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.shade200,
                                ),
                                child: const Text("Long-Drive",
                                    style: TextStyle(color: Colors.grey)),
                              ),
                            ),
                            InkWell(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 2.h, horizontal: 4.w),
                                margin: EdgeInsets.all(1.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.shade200,
                                ),
                                child: const Text("Hotel",
                                    style: TextStyle(color: Colors.grey)),
                              ),
                            ),
                            InkWell(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 2.h, horizontal: 4.w),
                                margin: EdgeInsets.all(1.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.shade200,
                                ),
                                child: const Text("Garden",
                                    style: TextStyle(color: Colors.grey)),
                              ),
                            ),
                            InkWell(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 2.h, horizontal: 4.w),
                                margin: EdgeInsets.all(1.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.shade200,
                                ),
                                child: const Text("Garden",
                                    style: TextStyle(color: Colors.grey)),
                              ),
                            ),
                            InkWell(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 2.h, horizontal: 4.w),
                                margin: EdgeInsets.all(1.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.shade200,
                                ),
                                child: const Text("Sunset-Point",
                                    style: TextStyle(color: Colors.grey)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Row for SeeAll and Popular beach ########################################################
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          'Popular Beach',
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          "See All",
                          style: TextStyle(
                              color: Color.fromARGB(255, 1, 49, 225),
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            //  For Beach Container ##############################################################
            Expanded(
              flex: 6,
              child: FutureBuilder<List<Beachmodel>>(
                builder: (context, snapshot) {
                  if (snapshot.hasData != null && snapshot.hasData) {
                    return SingleChildScrollView(
                        child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () => go_to_details_page(0),
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(3.w, 0, 3.w, 0),
                                  height: 20.h,
                                  child: Stack(fit: StackFit.expand, children: [
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(15.sp),
                                      child: Image.asset(
                                        "assets/img/beatch3.jpg",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                              colors: [
                                                Colors.black,
                                                Colors.transparent,
                                              ],
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.center),
                                          borderRadius:
                                              BorderRadius.circular(15.sp)),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(10.sp),
                                      padding: EdgeInsets.all(10.sp),
                                      alignment: Alignment.topRight,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(20.sp),
                                        child: Container(
                                            padding: EdgeInsets.all(10.sp),
                                            color:
                                                Colors.white.withOpacity(0.6),
                                            child: Icon(Icons.favorite,
                                                size: 18.sp)),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          bottom: 1.h, left: 4.h),
                                      alignment: Alignment.bottomCenter,
                                      child: Row(
                                        children: [
                                          Text(
                                            beachList[0].beachName.toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18.sp),
                                          ),
                                        ],
                                      ),
                                    )
                                  ]),
                                ),
                              ),
                              InkWell(
                                onTap: () => go_to_details_page(2),
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 3.w, vertical: 2.h),
                                  height: 25.h,
                                  child: Stack(fit: StackFit.expand, children: [
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(15.sp),
                                      child: Image.asset(
                                        "assets/img/beatch1.jpg",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                              colors: [
                                                Colors.black,
                                                Colors.transparent,
                                              ],
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.center),
                                          borderRadius:
                                              BorderRadius.circular(15.sp)),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(10.sp),
                                      padding: EdgeInsets.all(10.sp),
                                      alignment: Alignment.topRight,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(20.sp),
                                        child: InkWell(
                                          onTap: () {},
                                          child: Container(
                                              padding: EdgeInsets.all(10.sp),
                                              color:
                                                  Colors.white.withOpacity(0.6),
                                              child: Icon(Icons.favorite,
                                                  size: 18.sp)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          bottom: 1.h, left: 4.h),
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        beachList[2].beachName.toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.sp),
                                      ),
                                    )
                                  ]),
                                ),
                              ),
                              InkWell(
                                onTap: () => go_to_details_page(4),
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(3.w, 0, 3.w, 0),
                                  height: 20.h,
                                  child: Stack(fit: StackFit.expand, children: [
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(15.sp),
                                      child: Image.asset(
                                        "assets/img/beatch2.jpg",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                              colors: [
                                                Colors.black,
                                                Colors.transparent,
                                              ],
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.center),
                                          borderRadius:
                                              BorderRadius.circular(15.sp)),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(10.sp),
                                      padding: EdgeInsets.all(10.sp),
                                      alignment: Alignment.topRight,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(20.sp),
                                        child: InkWell(
                                          onTap: () {},
                                          child: Container(
                                              padding: EdgeInsets.all(10.sp),
                                              color:
                                                  Colors.white.withOpacity(0.6),
                                              child: Icon(Icons.favorite,
                                                  size: 18.sp)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          bottom: 1.h, left: 4.h),
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        beachList[4].beachName.toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.sp),
                                      ),
                                    )
                                  ]),
                                ),
                              ),
                              InkWell(
                                onTap: () => go_to_details_page(5),
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 3.w, vertical: 2.h),
                                  height: 25.h,
                                  child: Stack(fit: StackFit.expand, children: [
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(15.sp),
                                      child: Image.asset(
                                        "assets/img/beatch3.jpg",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                              colors: [
                                                Colors.black,
                                                Colors.transparent,
                                              ],
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.center),
                                          borderRadius:
                                              BorderRadius.circular(15.sp)),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(10.sp),
                                      padding: EdgeInsets.all(10.sp),
                                      alignment: Alignment.topRight,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(20.sp),
                                        child: InkWell(
                                          onTap: () {},
                                          child: Container(
                                              padding: EdgeInsets.all(10.sp),
                                              color:
                                                  Colors.white.withOpacity(0.6),
                                              child: Icon(Icons.favorite,
                                                  size: 18.sp)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          bottom: 1.h, left: 4.h),
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        beachList[5].beachName.toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.sp),
                                      ),
                                    )
                                  ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              //1//
                              InkWell(
                                onTap: () => go_to_details_page(1),
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(3.w, 0, 3.w, 0),
                                  height: 30.h,
                                  child: Stack(fit: StackFit.expand, children: [
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(15.sp),
                                      child: Image.asset(
                                        "assets/img/beatch4.jpg",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                              colors: [
                                                Colors.black,
                                                Colors.transparent,
                                              ],
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.center),
                                          borderRadius:
                                              BorderRadius.circular(15.sp)),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(10.sp),
                                      padding: EdgeInsets.all(10.sp),
                                      alignment: Alignment.topRight,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(20.sp),
                                        child: InkWell(
                                          onTap: () {},
                                          child: Container(
                                              padding: EdgeInsets.all(10.sp),
                                              color:
                                                  Colors.white.withOpacity(0.6),
                                              child: Icon(Icons.favorite,
                                                  size: 18.sp)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          bottom: 1.h, left: 4.h),
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        beachList[1].beachName.toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.sp),
                                      ),
                                    )
                                  ]),
                                ),
                              ),
                              //3//
                              InkWell(
                                onTap: () => go_to_details_page(3),
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 3.w, vertical: 2.h),
                                  height: 30.h,
                                  child: Stack(fit: StackFit.expand, children: [
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(15.sp),
                                      child: Image.asset(
                                        "assets/img/pexels-jean-frenna-1045113.jpg",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                              colors: [
                                                Colors.black,
                                                Colors.transparent,
                                              ],
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.center),
                                          borderRadius:
                                              BorderRadius.circular(15.sp)),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(10.sp),
                                      padding: EdgeInsets.all(10.sp),
                                      alignment: Alignment.topRight,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(20.sp),
                                        child: InkWell(
                                          onTap: () {},
                                          child: Container(
                                              padding: EdgeInsets.all(10.sp),
                                              color:
                                                  Colors.white.withOpacity(0.6),
                                              child: Icon(Icons.favorite,
                                                  size: 18.sp)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          bottom: 1.h, left: 4.h),
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        beachList[3].beachName.toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.sp),
                                      ),
                                    )
                                  ]),
                                ),
                              ),
                              //0//
                              InkWell(
                                onTap: () => go_to_details_page(0),
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(3.w, 0, 3.w, 0),
                                  height: 30.h,
                                  child: Stack(fit: StackFit.expand, children: [
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(15.sp),
                                      child: Image.asset(
                                        "assets/img/pandwa.jpg",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                              colors: [
                                                Colors.black,
                                                Colors.transparent,
                                              ],
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.center),
                                          borderRadius:
                                              BorderRadius.circular(15.sp)),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(10.sp),
                                      padding: EdgeInsets.all(10.sp),
                                      alignment: Alignment.topRight,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(20.sp),
                                        child: InkWell(
                                          onTap: () {},
                                          child: Container(
                                              padding: EdgeInsets.all(10.sp),
                                              color:
                                                  Colors.white.withOpacity(0.6),
                                              child: Icon(Icons.favorite,
                                                  size: 18.sp)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          bottom: 1.h, left: 4.h),
                                      alignment: Alignment.bottomCenter,
                                      child: Row(
                                        children: [
                                          Text(
                                            "Beatch",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18.sp),
                                          ),
                                          const Icon(Icons.location_on)
                                        ],
                                      ),
                                    ),
                                  ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ));
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
                future: getdata(),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          child: CurvedNavigationBar(
            onTap: (index) => setState(() {
              this.index = index;
            }),
            key: navigationKey,
            backgroundColor: Colors.transparent,
            height: 55,
            animationCurve: Curves.linear,
            animationDuration: const Duration(milliseconds: 200),
            buttonBackgroundColor: Colors.blue,
            color: Colors.white,
            index: index,
            items: const [
              Icon(
                Icons.home_outlined,
                size: 30,
              ),
              Icon(Icons.search_outlined, size: 30),
              Icon(Icons.apps_outlined, size: 30),
              Icon(Icons.person_outlined, size: 30),
            ],
          ),
        ),
      );
    });
  }

  void go_to_details_page(int idd) {
    {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) {
          return Finalpage1(
            idd: idd,
          );
        },
      ));
      print(idd);
    }
  }
}
//
// Future<String> getdata() async {
//   final dio = Dio(); // Provide a dio instance
//   dio.options.headers["Demo-Header"] =
//       "demo header"; // config your dio headers globally
//   final client = RestClient(dio);
//   String data = jsonDecode(await client.getData());
//   print(data.toString());
//   return data;
// }
