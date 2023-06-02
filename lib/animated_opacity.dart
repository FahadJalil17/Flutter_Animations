import 'dart:math';

import 'package:flutter/material.dart';

import 'cross_fade_animation.dart';

class AnimatedOpacityScreen extends StatefulWidget {
  const AnimatedOpacityScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedOpacityScreen> createState() => _AnimatedOpacityScreenState();
}

class _AnimatedOpacityScreenState extends State<AnimatedOpacityScreen> {
  var myOpacity = 1.0;
  var flag = true;
  Color color = Colors.cyan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Opacity"),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => CrossFadeAnimationScreen()));
          }, icon: Icon(Icons.arrow_forward_rounded))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: myOpacity,
              duration: Duration(seconds: 1),
              curve: Curves.slowMiddle,
              child: Container(
                width: 200,
                height: 100,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                // in this we have to change the value of opacity
                onPressed: () {
                  final random = Random();
                  setState(() {
                    if (flag) {  // here it is true
                      myOpacity = 0.1;  // invisible
                      flag = false;
                      color = Color.fromRGBO(random.nextInt(256),
                          random.nextInt(256), random.nextInt(256), myOpacity);
                    } else {
                      myOpacity = 1; // visible
                      flag = true;
                      color = Color.fromRGBO(random.nextInt(256),
                          random.nextInt(256), random.nextInt(256), myOpacity);
                    }
                  });
                },
                child: Text("Animate")),
          ],
        ),
      ),
    );
  }
}
