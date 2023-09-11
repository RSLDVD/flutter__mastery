import 'package:flutter/material.dart';
import 'package:flutter_mastery/Data/Repositories/section_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Data/Models/category.dart';
import '../Data/Models/section.dart';

class CategoryProvider with ChangeNotifier {
  final SharedPreferences prefs;
  CategoryProvider({required this.prefs}) {
    // Load favorite sections from SharedPreferences during initialization
    final favoriteSectionIds = prefs.getStringList('favoriteSections') ?? [];
    // _favoriteSections.addAll(
    //   categoryData.expand((category) => category.sections).where(
    //         (section) => favoriteSectionIds.contains(section.id),
    //       ),
    // );
    for (final category in _categoryData) {
      for (final section in category.sections) {
        if (favoriteSectionIds.contains(section.id)) {
          section.isFavorite = true;
          _favoriteSections.add(section);
        }
      }
    }
  }

  final List<Category> _categoryData = [
    Category(
        id: 'cat1',
        title: 'Basic Widgets',
        subtitle: [
          'scaffold,',
          'states,',
          'icon,',
          'text,',
          'row,',
          'column,',
          'Expand,',
          'Container,',
          'Stack,',
          //'CheckBox,',
          //'Switch,',
          
        ],
        imagePath: "assets/images/basicWidget.jpg",
        sections: k1section),
    Category(
        id: 'cat2',
        title: 'Lists',
        subtitle: [
          'ListTile,',
          'ListView.builder,',
          'GridList,',
          'ExpansionTile,',
          'Dissmissable List,',
          // 'Reorderable List,',
          //'',
          
        ],
        imagePath: "assets/images/advancedWidget.jpg",
        sections: k2section),
    Category(
        id: 'cat3',
        title: 'App Bar',
        subtitle: [
          'AppBar,',
          'SliverAppBar,',
          'BottomAppBar,',
          'PersistentAppBar,',
          //'CupertinoNavigationBar,',
          // 'CupertinoSliverNavigationBar,',
          // '...'
        ],
        imagePath: "assets/images/appbar.jpg",
        sections: k3section),
    Category(
        id: 'cat4',
        title: 'Navigation',
        subtitle: [
          'BottomNavigationBar,',
          'TabBar and TabBarView,',
          'Drawer,',
          //'FloatingActionButton (FAB),',
          'PageRouteBuilder,',
          // 'Navigator.pop & push,',
          // 'Navigator.pushReplacement,',
          // 'Navigator.popAndPushNamed,',
          // 'Navigator.pushNamedAndRemoveUntil,',
          // 'Navigator.pushReplacementNamed,'
        ],
        imagePath: "assets/images/navigation.jpg",
        sections: k4section),
    Category(
        id: 'cat5',
        title: 'Animation',
        subtitle: [
          'AppBar,',
          'SliverAppBar,',
          'BottomAppBar,',
          'PersistentAppBar,',
        ],
        imagePath: "assets/images/animation.jpg",
        sections: k5section),
    Category(
        id: 'cat6',
        title: 'State Management',
        subtitle: [
          'SetState,',
          'InheritedWidget,',
          'Provider,',
          'Bloc,',
          'GetX,',
          'RiverPod,',
          'Redux'
        ],
        imagePath: "assets/images/stateManagement.jpg",
        sections: k6section),
   
  ];

  List<Category> get categoryData {
    return [..._categoryData];
  }

  Category findCategoryById(String id) {
    return categoryData.firstWhere((c) => c.id == id);
  }

  //

  final List<Section> _favoriteSections = [];
  List<Section> get favoriteSections => _favoriteSections;
  //
  Future<void> toggleSectionFavorite(String sectionId, String catId) async {
    final loadedCategory = categoryData.firstWhere((c) => c.id == catId);
    final loadedSection = loadedCategory.sections
        .firstWhere((section) => section.id == sectionId);

    if (_favoriteSections.contains(loadedSection)) {
      _favoriteSections.remove(loadedSection);
      loadedSection.isFavorite = false;
      //notifyListeners();
    } else {
      _favoriteSections.add(loadedSection);
      loadedSection.isFavorite = true;
      //notifyListeners();
    }

    //loadedSection.isFavorite = !_favoriteSections.contains(loadedSection);
    final favoriteSectionIds =
        _favoriteSections.map((section) => section.id).toList();
    await prefs.setStringList('favoriteSections', favoriteSectionIds);

    notifyListeners();

    // Update the favorite sections list in SharedPreferences
  }
}
