import 'package:flutter/material.dart';

import '../page_animations/animated_list.dart';

class PositionedTransitionScreen extends StatefulWidget {
  const PositionedTransitionScreen({Key? key}) : super(key: key);

  @override
  State<PositionedTransitionScreen> createState() => _PositionedTransitionScreenState();
}

class _PositionedTransitionScreenState extends State<PositionedTransitionScreen> with SingleTickerProviderStateMixin{
  late AnimationController animationController;

  late var currentValue;

  late Animation curveAnimation;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(seconds: 4));

    curveAnimation = CurvedAnimation(parent: animationController, curve: Curves.bounceOut);


    animationController.addListener(() {
      setState(() {
        currentValue = animationController.value;
      });
    });

    animationController.repeat();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Positioned Transition Animation"),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => AnimatedListScreen()));
          }, icon: Icon(Icons.arrow_forward_rounded))
        ],
      ),
      body: Stack(
        children: [
          PositionedTransition(
            // like we use tween of double object in rotation position
            // we gonna give range of position in rectangular form
            // begin => giving the initial position of the ball
            //   rect: RelativeRectTween(begin: RelativeRect.fromLTRB(200, 0, 0, 700),
            //       end: RelativeRect.fromLTRB(0, 600, 0, 0)).animate(animationController),
              rect: RelativeRectTween(begin: RelativeRect.fromLTRB(0, 0, 0, 300),
                  end: RelativeRect.fromLTRB(0, 600, 200, 0)).animate(animationController),

              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
          ))
        ],
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(animationController.isAnimating){
            animationController.stop();
          }
          else{
            animationController.repeat();
          }
        },
        child: Icon(Icons.book),
      ),
    );
  }
}
