import 'dart:math';

import 'package:animated_containers/animated_listview_builder.dart';
import 'package:flutter/material.dart';

class AnimatedContainerScreen extends StatefulWidget {
  const AnimatedContainerScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedContainerScreen> createState() => _AnimatedContainerScreenState();
}

class _AnimatedContainerScreenState extends State<AnimatedContainerScreen> {
  double height = 100;
  double width = 100;
  Color color = Colors.black54;
  BorderRadiusGeometry radiusGeometry = BorderRadius.circular(10);

  // Animation is all about time

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Container"),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => AnimatedListViewBuilder()));
          }, icon: Icon(Icons.arrow_forward_rounded))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: AnimatedContainer(
              height: height,
              width: width,
              decoration: BoxDecoration(
                color: color,
                borderRadius: radiusGeometry
              ),
              duration: Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
            ),
          ),

        ],
      ),

      // we have to rebuild the widget when we will tap on button
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          final random = Random(); // for generating random numbers we have to create the object of Random class
          height = random.nextInt(300).toDouble();
          width = random.nextInt(300).toDouble();

          color = Color.fromRGBO(
            random.nextInt(256),
            random.nextInt(256),
            random.nextInt(256),
            1  // this is opacity
          );
          setState(() {

          });
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
