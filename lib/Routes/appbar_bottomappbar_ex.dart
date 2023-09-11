import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BottomAppBarEx extends StatefulWidget {
  const BottomAppBarEx({super.key});

  @override
  _BottomAppBarExState createState() => _BottomAppBarExState();
}

class _BottomAppBarExState extends State<BottomAppBarEx> {
  FloatingActionButtonLocation _fabLocation =
      FloatingActionButtonLocation.centerDocked;
  bool _isBottomBarNotched = true;
  bool _isFabMini = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Bottom App Bar'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {

            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          ListTile(
            title: const Text('FloatingActionButton position:'),
            trailing: DropdownButton<FloatingActionButtonLocation>(
              value: _fabLocation,
              onChanged: (FloatingActionButtonLocation? newVal) {
                if (newVal != null) {
                  setState(() => _fabLocation = newVal);
                }
              },
              items: const [
                DropdownMenuItem(
                  value: FloatingActionButtonLocation.centerDocked,
                  child: Text('Center Docked'),
                ),
                DropdownMenuItem(
                  value: FloatingActionButtonLocation.endDocked,
                  child: Text('End Docked'),
                ),
                DropdownMenuItem(
                  value: FloatingActionButtonLocation.miniStartTop,
                  child: Text('Mini Start Top'),
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text('Mini FAB:'),
            trailing: Switch(
              value: _isFabMini,
              onChanged: (bool val) {
                setState(() => _isFabMini = val);
              },
            ),
          ),
          ListTile(
            title: const Text('BottomAppBar notch:'),
            trailing: Switch(
              value: _isBottomBarNotched,
              onChanged: (bool val) {
                setState(() => _isBottomBarNotched = val);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        mini: _isFabMini,
        onPressed: () =>
            Fluttertoast.showToast(msg: 'Custom floating action button'),
        child: const Icon(Icons.star),
      ),
      floatingActionButtonLocation: _fabLocation,
      bottomNavigationBar: _buildBottomAppBar(context),
    );
  }

  BottomAppBar _buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
      shape: _isBottomBarNotched ? const CircularNotchedRectangle() : null,
      color: Theme.of(context).primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
