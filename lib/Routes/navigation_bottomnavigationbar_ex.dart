import 'package:flutter/material.dart';


class BottomNavigationBarEx extends StatefulWidget {
  @override
  _BottomNavigationBarExState createState() =>
      _BottomNavigationBarExState();
}

class _BottomNavigationBarExState
    extends State<BottomNavigationBarEx> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const PlaceholderWidget(Colors.red, 'Page 1'),
    const PlaceholderWidget(Colors.green, 'Page 2'),
    const PlaceholderWidget(Colors.blue, 'Page 3'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Navigation Bar Example'),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  final Color color;
  final String text;

  const PlaceholderWidget(this.color, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
