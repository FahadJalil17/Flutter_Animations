import 'package:flutter/material.dart';

class AnimatedContainerWSCube extends StatefulWidget {
  const AnimatedContainerWSCube({Key? key}) : super(key: key);

  @override
  State<AnimatedContainerWSCube> createState() => _AnimatedContainerWSCubeState();
}

class _AnimatedContainerWSCubeState extends State<AnimatedContainerWSCube> {
  var _width = 100.0;
  var _height = 100.0;
  BorderRadiusGeometry radiusGeometry = BorderRadius.circular(10);

  bool flag = true;
  Color color = Colors.black54;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Container 2"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: AnimatedContainer(
              height: _height,
              width: _width,
              curve: Curves.bounceInOut,
              decoration: BoxDecoration(
                borderRadius: radiusGeometry,
              color: color,
              ),
              duration: Duration(milliseconds: 700),),
          ),
          
          ElevatedButton(onPressed: (){
            setState(() {
              if(flag){
                _width = 100;
                _height = 200;
                flag = false;
                color = Colors.deepOrange;
              }
              // starting point or by default
              else{
                _width = 200;
                _height = 100;
                flag = true;
                color = Colors.black54;
              }


            });
          }, child: Text("Animate"))
        ],
      ),
    );
  }
}
