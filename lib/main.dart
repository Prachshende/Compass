import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';

    void main()
    {
      runApp(const MyApp());

    }
    class MyApp extends StatelessWidget {
      const MyApp({Key? key}) : super(key: key);

      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Flutter demo",
          theme: ThemeData(
            primarySwatch:  Colors.blue,
          ),
          home : HomeScreen(),
        );
      }
    }
    class HomeScreen extends StatefulWidget {
      const HomeScreen({Key? key}) : super(key: key);

      @override
      State<HomeScreen> createState() => _HomeScreenState();
    }

    class _HomeScreenState extends State<HomeScreen> {

      double? heading=0;

      @override
      void initState()
      {
        super.initState();
        FlutterCompass.events!.listen((event) {
          setState(() {
            heading = event.heading;
          });
        });
      }
      @override
      Widget build(BuildContext context) {
     return   Scaffold(
              backgroundColor: Colors.black,
       appBar: AppBar(
         backgroundColor: Colors.grey.shade900,
         centerTitle: true,
         title: Text("Compass App"),
     ),
       body: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           Text("${heading!.ceil()}°",
             style: TextStyle(color: Colors.white,
             fontSize: 26.0,
               fontWeight: FontWeight.bold,
             ),
           ),
           SizedBox(height: 50.0,
           ),

           Padding(
             padding: EdgeInsets.all(18.0),
             child:  Stack(
               alignment:  Alignment.center,
                children: [
                  Image.asset("assets/cadrant.png"),
                  Transform.rotate(angle: ((heading ?? 0)*(pi/180)*-1),
                    child: Image.asset("assets/compass.png",
                    scale: 1.1,
                    ),
                  ),

                ],
             ),
           )
         ],
       ),
        );
      }
    }

