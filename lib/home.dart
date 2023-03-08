import 'package:sujal_project/first_page.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Home1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      var sp;
      return Scaffold(
        body: Container(
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset("assets/img/home_bg.jpg", fit: BoxFit.cover),
                      Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.transparent, Colors.white],
                                begin: Alignment.center,
                                end: Alignment.bottomCenter,
                                stops: [-4, 7])),
                      ),
                    ],
                  )),
              // Container(
              //   decoration: BoxDecoration(
              //       gradient: LinearGradient(
              //           colors: [Colors.transparent, Colors.white],
              //           begin: Alignment.center,
              //           end: Alignment.bottomCenter,stops: [0.1,1])),
              // ),

              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(offset: Offset(0, 10))]),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Explore Various\nNatural Beauty of\nIndonesia",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 23.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: "google2"),
                          )),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                          child: Text(
                        "you can visit anywhere easily,order your ticket\nnow to get lots of promos",
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: 16.sp, fontFamily: "google2"),
                      )),
                      SizedBox(
                        height: 2.h,
                      ),
                      InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            height: 7.h,
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromRGBO(24, 61, 255, 0.8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30.sp),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return first_page();
                                }));
                              },
                              child: Text(
                                "Get Started",
                                style: TextStyle(
                                    fontFamily: "google2",
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
