import 'package:flutter/material.dart';

class SliverAppBarEx extends StatefulWidget {
  @override
  _SliverAppBarExState createState() => _SliverAppBarExState();
}

class _SliverAppBarExState extends State<SliverAppBarEx> {
  bool _isAppBarVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Sliver AppBar Example'),
            ),
          ),
          SliverToBoxAdapter(
            child: SwitchListTile(
              title: const Text('Toggle Sliver AppBar'),
              value: _isAppBarVisible,
              onChanged: (value) {
                setState(() {
                  _isAppBarVisible = value;
                });
              },
            ),
          ),
          if (_isAppBarVisible)
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
