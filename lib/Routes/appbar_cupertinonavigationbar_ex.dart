import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';



class CupertinoNavigationBarEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Cupertino Navigation Bar Example'),
        trailing: CupertinoButton(
          onPressed: () {
            // Add your settings action here
            Fluttertoast.showToast(msg: 'Settings button pressed');
          },
          child: const Icon(CupertinoIcons.settings),
        ),
      ),
      child: Center(
        child: CupertinoButton.filled(
          onPressed: () {
            // Add your button action here
            Fluttertoast.showToast(msg: 'Button pressed');
          },
          child: const Text('Press me'),
        ),
      ),
    );
  }
}
