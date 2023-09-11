import 'package:flutter/material.dart';

class BasicAppBarEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Example App Bar'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  value: 'item1',
                  child: Text('Item 1'),
                ),
                const PopupMenuItem(
                  value: 'item2',
                  child: Text('Item 2'),
                ),
              ];
            },
            onSelected: (value) {},
          ),
        ],
      ),
      body: const Center(
        child: Text('Hello, World!'),
      ),
    );
  }
}
