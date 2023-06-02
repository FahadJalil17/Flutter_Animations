import 'package:animated_containers/tween_animation.dart';
import 'package:flutter/material.dart';

import 'hero_anim_screen2.dart';


class HeroAnimationScreen extends StatefulWidget {
  const HeroAnimationScreen({Key? key}) : super(key: key);

  @override
  State<HeroAnimationScreen> createState() => _HeroAnimationScreenState();
}

class _HeroAnimationScreenState extends State<HeroAnimationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero Animation"),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => TweenAnimationScreen()));
          }, icon: Icon(Icons.arrow_forward_rounded))
        ],
      ),
      body: Container(
        child: Center(
          child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => HeroDetailScreen()));
            },
            child: Hero(
              // tag should be same in both screen
                tag: 'background',
            child: Image.asset('assets/sky.jpeg', height: 100, width: 150,)),
          ),
        ),
      ),
    );
  }
}
