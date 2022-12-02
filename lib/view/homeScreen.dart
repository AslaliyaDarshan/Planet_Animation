import 'package:flutter/material.dart';
import 'package:galaxy_planets/controller/controller_planets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  Galaxy_Controller galaxy_controller = Get.put(Galaxy_Controller());
  AnimationController ? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this,duration: Duration(seconds: 2));
    _animationController!.repeat();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade900,

      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            centerTitle: true,
            floating: true,
            pinned: true,
            backgroundColor: Colors.blue,
            flexibleSpace: FlexibleSpaceBar(
              background: Lottie.asset("assets/image/107763-solar-system-kasanima.json",fit: BoxFit.fill),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(15),
              ),
            ),
            leading: Icon(Icons.dehaze_outlined),
            title: Text("GALAXY PLANETS",style: TextStyle(color: Colors.white,fontSize: 25),),
            actions: [
              Container(padding:EdgeInsets.only(right: 20),child: Icon(Icons.search))
            ],
          ),
           SliverList(
             delegate: SliverChildBuilderDelegate(
               childCount: galaxy_controller.l1.length,
                (context,index){
                 return  InkWell(onTap: (){
                   galaxy_controller.DataPick = galaxy_controller.l1.value[index];
                   Get.toNamed('detail');
                 },
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                       Stack(
                         alignment: Alignment.centerLeft,
                         children: [
                           Container(
                             child: Column(
                               children: [
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     Padding(
                                       padding: EdgeInsets.only(top: 15,right: 40),
                                       child: Text("${galaxy_controller.l1.value[index].Name}",style: TextStyle(color: Colors.white,fontSize: 25),),
                                     ),
                                   ],
                                 ),

                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     Padding(
                                       padding: EdgeInsets.only(right: 30),
                                       child: Text("Milkyway Galaxy",style: TextStyle(color: Colors.grey),),
                                     )
                                   ],
                                 ),
                                 SizedBox(height: 20,),

                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     Text("☀️ ${galaxy_controller.l1.value[index].Location}",style: TextStyle(color: Colors.grey)),
                                     SizedBox(width: 15,),
                                     Text("🔁 ${galaxy_controller.l1.value[index].MS}",style: TextStyle(color: Colors.grey)),
                                   ],
                                 ),
                               ],
                             ),
                             margin: EdgeInsets.all(30),
                             height: 150,
                             width: MediaQuery.of(context).size.width*0.8,
                             decoration: BoxDecoration(
                               color: Colors.indigo.shade600,
                               borderRadius: BorderRadius.circular(8),
                             ),
                           ),
                           AnimatedBuilder(
                               animation: _animationController!,
                               builder: (context,v1){
                                 return Transform.rotate(
                                   angle: _animationController!.value*6,
                                   child:v1,
                                 );
                               },
                               child: Image.asset("${galaxy_controller.l1.value[index].Image}",width: 80,height: 80,fit: BoxFit.fill,)),
                         ],
                       ),
                     ],
                   ),
                 );
               },
             ),


          ),
        ],

      ),
    );
  }
}
