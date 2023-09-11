import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_mastery/Presentation/Screens/CategoriesPage/UI/categories_page_screen.dart';
import 'package:flutter_mastery/Presentation/Screens/FavoritesPage/favorites_page_screen.dart';
import 'package:flutter_mastery/Presentation/Screens/SectionPage/UI/section_page_screen.dart';
import 'package:flutter_mastery/Providers/theme_provider.dart';
import 'package:flutter_mastery/Theme/app_theme.dart';
import 'package:provider/provider.dart';

import 'Presentation/Screens/CategoryPage/UI/category_page_screen.dart';
import 'Providers/category_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CategoryProvider>(
          create: (_) => CategoryProvider(prefs: prefs),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: MyApp(prefs: prefs),
    ),
  );
}

class MyApp extends StatefulWidget  {
  final SharedPreferences prefs;
  const MyApp({Key? key, required this.prefs}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Flutter Mastery',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: Provider.of<ThemeProvider>(context).isDarkMode
          ? ThemeMode.dark
          : ThemeMode.light,
      home: const CategoriesPageScreen(),
      
      routes: {
        '/category': (context) => const CategoryPageScreen(),
        '/section_page': (context) => const SectionPageScreen(),
        '/favorites': (context) => const FavoritesPageScreen(),
      },
    );
  }

  @override
  void initState() {
    super.initState();
    // Register this class as an observer of app lifecycle events
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // Unregister this class as an observer when it's no longer needed
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Handle app lifecycle state changes here
    switch (state) {
      case AppLifecycleState.inactive:
        // The app is inactive, e.g., in the background
        break;
      case AppLifecycleState.resumed:
        // The app is resumed, e.g., brought to the foreground
        break;
      case AppLifecycleState.paused:
        // The app is paused, e.g., sent to the background
        break;
      case AppLifecycleState.detached:
        // The app is detached (uncommon)
        break;
      case AppLifecycleState.hidden:
        // 
    }
  }
}
