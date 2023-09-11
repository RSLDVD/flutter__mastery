import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class GridStaggeredAnimationsEx extends StatelessWidget {
  final Random _random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimationLimiter(
        child: GridView.count(
          crossAxisCount: 2,
          children: AnimationConfiguration.toStaggeredList(
            duration: const Duration(milliseconds: 444),
            childAnimationBuilder: (widget) => SlideAnimation(
              horizontalOffset: 50.0,
              child: FadeInAnimation(
                child: widget,
              ),
            ),
            children: List.generate(10, (index) {
              Color randomColor = Color.fromRGBO(
                _random.nextInt(256),
                _random.nextInt(256),
                _random.nextInt(256),
                1,
              );
              return Container(
                margin: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Color.fromARGB(73, 228, 180, 180),
                ),
                child: Center(
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: randomColor,
                      child: Text('Item $index'),
                    ),
                    subtitle: Text('Item $index'),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
