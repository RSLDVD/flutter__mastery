import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';


class WebLogPageScreen extends StatelessWidget {
  const WebLogPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipOval(
        child: FlipCard(
          autoFlipDuration: const Duration(seconds: 2) ,
          direction: FlipDirection.HORIZONTAL, // or FlipDirection.VERTICAL
          front: Container(
            width: 200, // Adjust the size as needed
            height: 200, // Adjust the size as needed
            color: Theme.of(context).splashColor,
            child: const Center(
              child: Text(
                'Coming Soon',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
            ),
          ),
          back: Container(
            width: 200, // Adjust the size as needed
            height: 200, // Adjust the size as needed
            color: Colors.transparent, // You can change this to a different color
            child: const Center(
              child: CircleAvatar(
                      radius: 100,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage(
                        'assets/images/ic_launcher0.png',
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
