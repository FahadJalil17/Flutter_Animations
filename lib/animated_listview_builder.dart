import 'dart:math';

import 'package:animated_containers/animated_opacity.dart';
import 'package:flutter/material.dart';

class AnimatedListViewBuilder extends StatefulWidget {
  const AnimatedListViewBuilder({Key? key}) : super(key: key);

  @override
  State<AnimatedListViewBuilder> createState() => _AnimatedListViewBuilderState();
}

class _AnimatedListViewBuilderState extends State<AnimatedListViewBuilder> {

  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  List<int> item = [];
  int count = 0;
  final random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated ListView Builder"),
        actions: [
          IconButton(onPressed: (){
            listKey.currentState!.removeItem(0, (context, animation) =>
                slideTran(context, 0, animation),

            duration: Duration(milliseconds: 400));
          }, icon: Icon(Icons.remove_circle_outline)),
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => AnimatedOpacityScreen()));
          }, icon: Icon(Icons.arrow_forward_rounded)),
        ],
      ),
      body: SafeArea(
        child: AnimatedList(
          key: listKey,
          initialItemCount: item.length,
          itemBuilder: (context, index, animation){
            return slideTran(context, index, animation);  // if you want to use sizeTran then use sizeTran instead of slideTran
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          listKey.currentState!.insertItem(0, duration: Duration(milliseconds: 400));
          item = []..add(count++)..addAll(item);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget slideTran(BuildContext context, int index, animation){
    int newItem = item[index];
    return SlideTransition(
      
      position: Tween<Offset>(
        begin: Offset(1, 1),
        end: Offset(0, 0)
      ).animate(animation),
      child: SizedBox(
        height: 100,
        width: double.infinity,
        child: Card(
          // color: Colors.primaries[index % Colors.primaries.length],
          color: Color.fromRGBO(
              random.nextInt(256),
              random.nextInt(256),
              random.nextInt(256),
              0.7  ),
          child: Text("Item "+ newItem.toString(), style: Theme.of(context).textTheme.headlineSmall,),
        ),
      ),
    );
  }
  
  Widget sizeTran(BuildContext context, int index, animation){
    int newItem = item[index];
    return SizeTransition(
      sizeFactor: animation,
      axis: Axis.vertical,
      child: SizedBox(
        height: 100,
        width: double.infinity,
        child: Card(
          color: Colors.primaries[index % Colors.primaries.length],
          child: Text("Item "+ newItem.toString(), style: Theme.of(context).textTheme.headlineSmall,),
        ),
      ),
    );
  }

}

