import 'package:flutter/material.dart';
import 'package:flutter_mastery/Providers/theme_provider.dart';
import 'package:provider/provider.dart';

class AnimSwitch extends StatefulWidget {
   const AnimSwitch({Key? key}) : super(key: key);

  @override
  AnimSwitchState createState() => AnimSwitchState();
}

class AnimSwitchState extends State<AnimSwitch>
    with SingleTickerProviderStateMixin {
  final Duration _duration = const Duration(milliseconds: 700);
  late Animation<Alignment> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _duration);
    _animation =
        AlignmentTween(begin: Alignment.centerLeft, end: Alignment.centerRight)
            .animate(
      CurvedAnimation(
          parent: _animationController,
          curve: Curves.bounceOut,
          reverseCurve: Curves.bounceIn),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    dynamic themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (_animationController.isCompleted) {
               _animationController.reverseDuration;
              _animationController.reverse();
              
            } else {
              _animationController.forward();
            }

            //final themeProvider=Provider.of<ThemeProvider>(context, listen: false);
            themeProvider.toggleTheme();
          });
        },
        child: Container(
          width: 85,
          height: 38,
          //padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          decoration: BoxDecoration(
            image: themeProvider.isDarkMode
                ? const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/nightsky2.gif'))
                : const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/lightsky.gif')),
            //color: isChecked ? Colors.amber.withOpacity(0.38) : Colors.black38,
            borderRadius: const BorderRadius.all(
              Radius.circular(80),
            ),
            boxShadow: [
              BoxShadow(
                color: themeProvider.isDarkMode
                    ? const Color(0xFF65647C)
                    : const Color(0xFF57375D),
                blurRadius: 0.1,
                offset: const Offset(0, 0.25),
              ),
            ],
          ),
          child: Stack(
            //fit: StackFit.expand,
            //alignment: Alignment.center,
            children: <Widget>[
              Align(
                alignment: _animation.value ,//* 1.2,
                child: RotationTransition(
                  //alignment: Alignment.center,
                  turns: _animationController,
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.1),
                          blurRadius: 0.5,
                          offset: const Offset(0, 0.5),
                        )
                      ],
                      //color: Colors.white,
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                        radius: 40,
                        backgroundImage: themeProvider.isDarkMode
                            ? const AssetImage("assets/images/fullmoon.gif")
                            : const AssetImage("assets/images/d_light.jpg")),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
