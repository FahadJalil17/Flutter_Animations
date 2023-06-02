import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'explicit_animation/rotation_transition.dart';

class TweenAnimationScreen extends StatefulWidget {
  const TweenAnimationScreen({Key? key}) : super(key: key);

  @override
  State<TweenAnimationScreen> createState() => _TweenAnimationScreenState();
}

class _TweenAnimationScreenState extends State<TweenAnimationScreen> with SingleTickerProviderStateMixin{
  late Animation animation;
  late Animation colorAnimation;
  late AnimationController animationController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(seconds: 3));
    animation = Tween(begin: 350.0, end: 100.0).animate(animationController);

    // we have to use ColorTween here
    colorAnimation = ColorTween(begin: Colors.cyan, end: Colors.deepPurple).animate(animationController);

    // when value is updated it is listening the controller
    // we want to show the value in ui so we have to use setState fo that
    animationController.addListener(() {
      setState(() {

      });
    });

    animationController.forward(); // it will move from 0.0 to 100.0 so that's why we have to use forward here

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tween Animation"),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, PageTransition(child: RotationTransitionScreen(), type: PageTransitionType.bottomToTop));
            // Icon(Icons.arrow_forward_rounded);
          },
              icon: Icon(Icons.arrow_forward_rounded)),
        ],
      ),
      body: Center(
        child: Container(
          height: animation.value,
          width: animation.value,
          color: colorAnimation.value,
        ),
      ),
    );
  }
}
