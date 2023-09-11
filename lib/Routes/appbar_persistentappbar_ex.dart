import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PersistentAppBarEx extends StatefulWidget {
  const PersistentAppBarEx({Key? key}) : super(key: key);

  @override
  _PersistentAppBarExState createState() => _PersistentAppBarExState();
}

class _PersistentAppBarExState extends State<PersistentAppBarEx> {
  bool _isAppBarVisible = true;
  bool _isFabMini = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Persistent App Bar'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          ListTile(
            title: const Text('Show App Bar:'),
            trailing: Switch(
              value: _isAppBarVisible,
              onChanged: (bool val) {
                setState(() => _isAppBarVisible = val);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar:
          _isAppBarVisible ? _buildPersistentAppBar(context) : null,
    );
  }

  Widget _buildPersistentAppBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30.0),
      child: BottomAppBar(
        shape: CustomShapeBorder(),
        color: Theme.of(context).primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => _showCustomModalBottomSheet(context),
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () =>
                  Fluttertoast.showToast(msg: 'Custom search action.'),
            ),
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () =>
                  Fluttertoast.showToast(msg: 'Custom menu action.'),
            ),
          ],
        ),
      ),
    );
  }

  void _showCustomModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) => Container(
        alignment: Alignment.center,
        height: 200,
        child: const Text('Custom bottom sheet'),
      ),
    );
  }
}
//
//

class CustomShapeBorder extends NotchedShape {
  @override
  Path getOuterPath(Rect host, Rect? guest) {
    final path = Path();
    const cornerRadius = 0.0;
    const xOffset = 25.0;
    const yOffset = 25.0;
    const bottomMargin = 25.0;
    const topMargin = 0.0;
    const appBarHeight = 110.0;

    path.moveTo(0 + xOffset, topMargin);
    path.lineTo(host.width - xOffset, topMargin);
    path.lineTo(host.width - xOffset, appBarHeight - yOffset - bottomMargin);
    path.lineTo(0 + xOffset, appBarHeight - yOffset - bottomMargin);

    path.lineTo(cornerRadius + xOffset, appBarHeight - yOffset - bottomMargin);
    path.arcToPoint(
      const Offset(0 + xOffset, appBarHeight - cornerRadius - yOffset - bottomMargin),
      clockwise: false,
      radius: const Radius.circular(cornerRadius),
    );

    path.close();
    return path;
  }

  @override
  Path getInnerPath(Rect host, Rect? guest) {
    // Return an empty path for the inner notch (no notch)
    return Path();
  }
}
