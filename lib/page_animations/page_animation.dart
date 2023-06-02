import 'package:animated_containers/tween_animation.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class PageAnimationScreen extends StatefulWidget {
  const PageAnimationScreen({Key? key}) : super(key: key);

  @override
  State<PageAnimationScreen> createState() => _PageAnimationScreenState();
}

class _PageAnimationScreenState extends State<PageAnimationScreen> {
  // double screenHeight = 0;
  // double screenWidth = 0;
  bool startAnimation = false;


  List<String> cities = [
    'Islamabad',
    'Lahore',
    'Tokyo',
    'Delhi',
    'Karachi',
    'Sao Paulo',
    'Mexico City',
    'Dubai',
    'Dhaka',
    'Beijing',
    'Mumbai',
    'New York',
    'Istanbul',
    'Kolkata',
    'Peshawar',
    'Moscow'
  ];

  // we can set the bool to true after first build is done
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    reload();
  }

  void reload() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        startAnimation = true;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    // screenHeight = MediaQuery
    //     .of(context)
    //     .size
    //     .height;
    // screenWidth = MediaQuery
    //     .of(context)
    //     .size
    //     .width;

    return AnimatedContainer(
      duration: Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
      transform: Matrix4.translationValues(startAnimation ? 0 : 500, 0, 0),
      child: Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          title: Text("Animated List Screen"),
          // actions: [
          //   IconButton(onPressed: (){
          //     Navigator.push(context, PageTransition(child: TweenAnimationScreen(), type: PageTransitionType.topToBottom));
          //   }, icon: Icon(Icons.arrow_forward_rounded))
          // ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 30,),
                InkWell(
                  onTap: () {
                    setState(() {
                      if (startAnimation) {
                        startAnimation = false;
                      }
                      else {
                        startAnimation = true;
                      }
                    });
                  },
                  child: Text("List",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 30,),

                ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: cities.length,
                    itemBuilder: (context, index) {
                      return items(index);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget items(int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300 + (index * 200)),
      height: 55,
      curve: Curves.easeInOut,
      transform: Matrix4.translationValues(startAnimation ? 0 : 500, 0, 0),  
      // transform: Matrix4.translationValues(0, startAnimation ? 0 : screenHeight, 0),
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(horizontal:20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        children: [
          Text("${index + 1}. ${cities[index]}", style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500
          ),)
        ],
      ),
    );
  }
}