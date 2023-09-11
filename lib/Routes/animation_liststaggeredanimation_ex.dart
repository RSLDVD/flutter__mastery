import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ListStaggeredAnimationsEx extends StatelessWidget {

  final Random _random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimationLimiter(
         child: ListView.builder(
           itemCount: 10,
           itemBuilder: (context, index) {
             Color randomColor = Color.fromRGBO(
               _random.nextInt(256),
               _random.nextInt(256),
               _random.nextInt(256),
               1,
             );
             return AnimationConfiguration.staggeredList(
               position: index,
               duration: const Duration(milliseconds: 500),
               child: SlideAnimation(
                 verticalOffset: 250.0,
                 child: FadeInAnimation(
                   child: ListTile(
                     title: CircleAvatar(
                       radius: 50,
                       backgroundColor: randomColor,
                       child: Text('Item $index'),
                     ),
                   ),
                 ),
               ),
             );
           },
         ),
       ),
    );
  }
}
