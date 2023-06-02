import 'package:animated_containers/page_animations/page_animation.dart';
import 'package:flutter/material.dart';

class AnimatedListScreen extends StatefulWidget {
  const AnimatedListScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedListScreen> createState() => _AnimatedListScreenState();
}

class _AnimatedListScreenState extends State<AnimatedListScreen> {
  double screenHeight = 0;
  double screenWidth = 0;
  bool startAnimation = false;


  List<String> countries = ['Pakistan', 'China', 'Iran', 'Albania', 'Andorra', 'Armenia', 'Austria',
    'Azerbaijan', 'Belgium', 'Bosnia', 'Bulgaria', 'Croatia', 'Cyprus'];

  // we can set the bool to true after first build is done
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    reload();
  }

  void reload(){
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        startAnimation = true;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black87,
      appBar:AppBar(
        title: Text("Animated List Screen"),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => PageAnimationScreen()));
          }, icon: Icon(Icons.arrow_forward_rounded))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: screenWidth / 20),
          child: Column(
            children: [
              SizedBox(height: 30,),
              InkWell(
                onTap: (){
                  setState(() {
                   if(startAnimation){
                     startAnimation = false;
                   }
                   else{
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
                itemCount: countries.length,
                  itemBuilder: (context, index){
               return items(index);
              })
            ],
          ),
        ),
      ),
    );
  }

  Widget items(int index){
    return AnimatedContainer(
      duration: Duration(milliseconds: 400 + (index * 100)),
      height: 55,
      width: screenWidth,
      curve: Curves.easeInOut,
      // transform: Matrix4.translationValues(startAnimation ? 0 : screenWidth, 0, 0),  // for animation coming from left side
      transform: Matrix4.translationValues(0, startAnimation ? 0 : screenHeight, 0), // for animation coming from bottom side
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: screenWidth / 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        children: [
          Text("${index + 1}. ${countries[index]}", style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500
          ),)
        ],
      ),
    );
  }

}
