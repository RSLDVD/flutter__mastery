import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CupertinoSliverNavigationBarEx extends StatefulWidget {
  @override
  _CupertinoSliverNavigationBarExState createState() =>
      _CupertinoSliverNavigationBarExState();
}

class _CupertinoSliverNavigationBarExState
    extends State<CupertinoSliverNavigationBarEx> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Cupertino Sliver Nav Bar Example'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Fluttertoast.showToast(msg: 'Settings Button Pressed');
          },
          child: const Icon(CupertinoIcons.settings),
        ),
      ),
      child: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: const Text('Welcome to Cupertino'),
            trailing: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Fluttertoast.showToast(msg: 'Profile Button Pressed');
              },
              child: const Icon(CupertinoIcons.profile_circled),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  title: Text('List Item $index'),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
