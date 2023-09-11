
import 'package:flutter/material.dart';


class TabBarScreenEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar and TabBarView Example'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Tab 1'),
              Tab(text: 'Tab 2'),
              Tab(text: 'Tab 3'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Content of Tab 1')),
            Center(child: Text('Content of Tab 2')),
            Center(child: Text('Content of Tab 3')),
          ],
        ),
      ),
    );
  }
}

