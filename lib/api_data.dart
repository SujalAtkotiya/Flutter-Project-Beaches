import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:dio/dio.dart';
import 'package:sujal_project/api/rest_client.dart';
import 'package:sujal_project/beachmodel.dart';

class api_call extends StatelessWidget {
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
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<Beachmodel>>(
        builder: (context, snapshot) {
          if (snapshot.hasData != null && snapshot.hasData) {
            return Text(beachList[1].price.toString());
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        future: getdata(),
      ),
    );
  }
}

// Future<String> getdata() async {
//   final dio = Dio(); // Provide a dio instance
//   // dio.options.headers["Demo-Header"] =
//   //     "demo header"; // config your dio headers globally
//   final client = RestClient(dio);
//   String data = await client.getData();
//   print(data);
//   return data;
// }
