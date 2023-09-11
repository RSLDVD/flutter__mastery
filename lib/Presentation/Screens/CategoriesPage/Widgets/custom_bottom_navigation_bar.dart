import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final ValueChanged<int> onIndexChanged;

  const CustomBottomNavigationBar({Key? key, required this.onIndexChanged})
      : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onIndexChanged(_selectedIndex); // Call the callback
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      selectedItemColor: Theme.of(context).bottomAppBarColor,
      items: [
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          'assets/icons/home.svg',
          width: 24,
          height: 24,
          color: Theme.of(context).appBarTheme.iconTheme?.color,
        ),
        label: 'Home',
      ),
       BottomNavigationBarItem(
        icon: Icon(Icons.web, color:Theme.of(context).appBarTheme.iconTheme?.color, ),
        label: 'WebLog',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          'assets/icons/bookmark-list.svg',
          width: 24,
          height: 24,
          color: Theme.of(context).appBarTheme.iconTheme?.color,
        ),
        label: 'Favorites',
      )
    ], currentIndex: _selectedIndex, onTap: _onItemTapped);
  }
}
