import 'package:flutter/material.dart';
import 'package:galaxy_planets/view/homeScreen.dart';
import 'package:galaxy_planets/view/detailScreen.dart';
import 'package:galaxy_planets/view/spleshScreen.dart';
import 'package:get/get.dart';

void main(){
  runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context)=>spleshScreen(),
          'home':(context)=> HomeScreen(),
          'detail':(context)=>DetailScreen(),

        },
      )
  );
}
