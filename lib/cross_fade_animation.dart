import 'package:animated_containers/hero_animation.dart';
import 'package:flutter/material.dart';

class CrossFadeAnimationScreen extends StatefulWidget {
  const CrossFadeAnimationScreen({Key? key}) : super(key: key);

  @override
  State<CrossFadeAnimationScreen> createState() => _CrossFadeAnimationScreenState();
}

class _CrossFadeAnimationScreenState extends State<CrossFadeAnimationScreen> {
  bool isFirst = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Timer(Duration(seconds: 4), (){
    //   reload();
    // });
  }

  // don't use setState in initState it will rebuild the widget tree which isn,t build yet
  void reload(){
    setState(() {
      if(isFirst){
        isFirst = false;
      }
      else{
        isFirst = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cross Fade Animation"),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => HeroAnimationScreen()));
          }, icon: Icon(Icons.arrow_forward_rounded))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedCrossFade(
              duration: Duration(seconds: 2),

              firstChild: Container(
                height: 200,
                width: 200,
                color: Colors.blueGrey,
              ),
              // when size is different of both then this will work
              // sizeCurve: Curves.fastOutSlowIn,

              firstCurve: Curves.easeInOut,
              secondCurve: Curves.bounceInOut,
              secondChild: Container(
                  child: Image.asset("assets/car.jpeg", width: 200, height: 200, fit: BoxFit.cover,)),
              crossFadeState: isFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            ),
            
            ElevatedButton(onPressed: (){
              reload();
            }, child: Text("Show")),


          ],
        ),
      ),
    );
  }
}
