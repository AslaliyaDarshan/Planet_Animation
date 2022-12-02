import 'dart:async';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class spleshScreen extends StatefulWidget {
  const spleshScreen({Key? key}) : super(key: key);

  @override
  State<spleshScreen> createState() => _spleshScreenState();
}

class _spleshScreenState extends State<spleshScreen> {
  @override
  Widget build(BuildContext context) {
    isLogin();
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
                "assets/image/40712-circling-of-the-sun-by-the-planets-was-discovered-by-nicolaus-copernicus.json",
                fit: BoxFit.fill),
            SizedBox(
              height: 15,
            ),
            Text(
              "GALAXY PLANETS",
              style: TextStyle(fontSize: 27, color: Colors.white),
            ),
          ],
        ),
      ),
    ));
  }

  void isLogin() async {
    Timer(
      Duration(seconds: 10),
      () => Get.offAllNamed('home'),
    );
  }
}
