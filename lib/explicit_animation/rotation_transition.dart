import 'package:animated_containers/explicit_animation/positioned_transition.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';


class RotationTransitionScreen extends StatefulWidget {
  const RotationTransitionScreen({Key? key}) : super(key: key);

  @override
  State<RotationTransitionScreen> createState() => _RotationTransitionScreenState();
}

class _RotationTransitionScreenState extends State<RotationTransitionScreen> with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  // for storing the current value of animation
  late double currentValue;

  // late Animation curveAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // let's give 4 seconds to complete one rotation
    animationController = AnimationController(vsync: this, duration: Duration(seconds: 4));

    // curveAnimation = CurvedAnimation(parent: animationController, curve: Curves.elasticOut);

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
        title: Text("Rotation Transition Animation"),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, PageTransition(child: PositionedTransitionScreen(), type: PageTransitionType.leftToRight));
            // Icon(Icons.arrow_forward_rounded);
          },
              icon: Icon(Icons.arrow_forward_rounded)),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Text("$currentValue", style: TextStyle(fontSize: 30),),

            // this rotation transition uses the range from 0 to 1 for rotating it's child =>
            // 0 means no rotation and 1 means complete cycle 2pi
            RotationTransition(
              // first property we have to define is child which is the object we want to rotate => this object will be rotating on screen
              child: Container(
                width: 200,
                height: 200,
                color: Colors.teal,
              ),
              // now we have to specify the point around which our object will rotate for that we have alignment property
              alignment: Alignment.center,

              // we need to give the animation instance that uses animation controller and this is what it makes explicit animation
              // we have to specify animation object
              turns: Tween<double>(begin: 0.0, end: 1.0).animate(animationController),
            ),
          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // let's add start and stop feature so we can make some use of this animation controller
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          // first we have to check whether our animation is in continuos state or it is stop
          if(animationController.isAnimating){
            animationController.stop();
          }
          else{
            animationController.repeat();  // if it's already stop then we can add repeat
          }
        },
        child: Icon(Icons.book),
      ),
    );
  }
}