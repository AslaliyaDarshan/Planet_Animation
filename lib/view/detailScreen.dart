import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controller_planets.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with SingleTickerProviderStateMixin {
  Galaxy_Controller galaxy_controller = Get.put(Galaxy_Controller());
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animationController!.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            child: SingleChildScrollView(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    children: [
                      Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Image.asset(
                            "${galaxy_controller.DataPick!.Image2}",
                            height: 420,
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:
                                    Icon(Icons.more_vert, color: Colors.white),
                              )
                            ],
                          )
                        ],
                      ),
                      SingleChildScrollView(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.5,
                          color: Colors.indigo.shade900,
                          child: Center(
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 150,
                                          ),
                                          Text(
                                            "OVERVIEW",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(right: 95),
                                            height: 3,
                                            width: 40,
                                            color: Colors.blue,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .9,
                                        child: Text(
                                          "${galaxy_controller.DataPick!.Overview}",
                                          style:
                                              TextStyle(color: Colors.white70),
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: 50, left: 10, right: 10, bottom: 10),
                        height: 200,
                        width: MediaQuery.of(context).size.width * .9,
                        decoration: BoxDecoration(
                          color: Colors.indigo.shade600,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 70,
                                ),
                                Text(
                                  "${galaxy_controller.DataPick!.Name}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                                Text(
                                  "Milkyway Galaxy",
                                  style: TextStyle(color: Colors.white70),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 3,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                        "☀  ${galaxy_controller.DataPick!.Location}",
                                        style: TextStyle(color: Colors.grey)),
                                    SizedBox(
                                      width: 25,
                                    ),
                                    Text(
                                        "🔁  ${galaxy_controller.DataPick!.MS}",
                                        style: TextStyle(color: Colors.grey)),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      AnimatedBuilder(
                          animation: _animationController!,
                          builder: (context, v2) {
                            return Transform.rotate(
                              angle: _animationController!.value * 6,
                              child: v2,
                            );
                          },
                          child: Image.asset(
                            "${galaxy_controller.DataPick!.Image}",
                            height: 100,
                            width: 100,
                            fit: BoxFit.fill,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              return BottomBarDilaog();
            },
            child: Container(
              height: 70,
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 6, bottom: 6, left: 15),
                    child: Column(
                      children: [
                        Text(
                          "START FROM",
                          style: TextStyle(color: Colors.white70),
                        ),
                        Text(
                          "\$${galaxy_controller.DataPick!.Price}m",
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 6, bottom: 6, right: 20),
                    child: Text(
                      "BOOK NOW >",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }

  void BottomBarDilaog() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Colors.indigo.shade600,
            height: 350,
            width: double.infinity,
            child: Column(
              children: [
                // AppBar(
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.vertical(
                //       bottom: Radius.circular(15),
                //     ),
                //   ),
                //   title: Text("Welcome to MERCURY",style: TextStyle(color: Colors.white,fontSize: 20),),
                // ),
                //
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                  ),
                  child: Center(
                      child: Text(
                          "Welcome to ${galaxy_controller.DataPick!.Name}",
                          style: TextStyle(color: Colors.white, fontSize: 30))),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    "${galaxy_controller.DataPick!.Image}",
                    height: 120,
                    width: 120,
                    fit: BoxFit.fill,
                  ),
                ),
                Text(
                  "Distance to Sun",
                  style: TextStyle(color: Colors.white70),
                ),
                Text(
                  "${galaxy_controller.DataPick!.Sun}",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Distance to Earth",
                  style: TextStyle(color: Colors.white70),
                ),
                Text(
                  "${galaxy_controller.DataPick!.Earth}",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ],
            ),
          );
        });
  }
}
