import 'package:animated_containers/tween_animation.dart';
import 'package:flutter/material.dart';

class HeroDetailScreen extends StatefulWidget {
  const HeroDetailScreen({Key? key}) : super(key: key);

  @override
  State<HeroDetailScreen> createState() => _HeroDetailScreenState();
}

class _HeroDetailScreenState extends State<HeroDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero Animation 2"),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => TweenAnimationScreen()));
          }, icon: Icon(Icons.arrow_forward_rounded))
        ],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Hero(
              tag: 'background',
              child: Image.asset('assets/sky.jpeg'),
            ),
          ),
        ],
      ),
    );
  }
}
