// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
//
import 'package:flutter_mastery/Action/anim_switch.dart';
import 'package:flutter_mastery/Presentation/Screens/CategoriesPage/Widgets/categories_grid_view_builder.dart';
import 'package:flutter_mastery/Presentation/Screens/CategoriesPage/Widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter_mastery/Presentation/Screens/Drawer%20Screens/about_us.dart';
import 'package:flutter_mastery/Presentation/Screens/Drawer%20Screens/privacy_policy.dart';
import 'package:flutter_mastery/Presentation/Screens/Drawer%20Screens/terms_conditions.dart';
import 'package:flutter_mastery/Presentation/Screens/FavoritesPage/favorites_page_screen.dart';
import 'package:flutter_mastery/Presentation/Screens/WebLogPage/web_log_page_screen.dart';
import 'package:flutter_mastery/Providers/theme_provider.dart';


class CategoriesPageScreen extends StatefulWidget {
  const CategoriesPageScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesPageScreen> createState() => _CategoriesPageScreenState();
}

class _CategoriesPageScreenState extends State<CategoriesPageScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // _animationController = AnimationController(
    //   vsync: this, // Use "this" as the vsync parameter
    //   duration: const Duration(milliseconds: 300),
    // );
    // _animationController.forward();
  }

  @override
  void dispose() {
    // _animationController.dispose();
    super.dispose();
  }

   Future<bool> _showExitConfirmationDialog(BuildContext context) async {
  bool? confirm = await showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Exit Confirmation'),
        content: const Text('Do you want to leave App?'),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('No'),
            onPressed: () {
              Navigator.of(context).pop(false); // User wants to stay
            },
          ),
          ElevatedButton(
            child: const Text('Yes'),
            onPressed: () {
              Navigator.of(context).pop(true); // User confirms leaving
            },
          ),
        ],
      );
    },
  );

  // Return the user's choice (true for leaving, false for staying)
  return confirm ?? false;
}



  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const CategoryGridViewBuilder(),
      const WebLogPageScreen(),
      const FavoritesPageScreen(),
    ];

    //List<Category> categories = context.watch<CategoryProvider>().categoryData;

    return WillPopScope(
      onWillPop: () async {
        // Show the exit confirmation dialog when the user tries to exit the page
        bool confirm = await _showExitConfirmationDialog(context);
        return confirm;
      },

      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          // actions: [
          //   IconButton(onPressed: () => {}, icon: const Icon(Icons.search))
          // ],
          //backgroundColor: const Color(0xfff8ffd8),
          title: RichText(
            text: TextSpan(
                text: 'Flutter ',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).appBarTheme.titleTextStyle?.color,
                ),
                children: const [
                  TextSpan(
                      text: 'Mastery ',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFD71313),
                      )),
                  
                ]),
          ),
        ),
        drawer: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              DrawerHeader(
                decoration:  BoxDecoration(
                    //image: DecorationImage(
                    // image: AssetImage(
                    //   "assets/images/sleepycat.gif",
                    // ),
                    // fit: BoxFit.fill
                    //),
    
                    color: Theme.of(context).appBarTheme.backgroundColor
                    ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                              text: 'Flutter ',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .appBarTheme
                                    .titleTextStyle
                                    ?.color,
                              ),
                              children: const [
                                TextSpan(
                                    text: 'Mastery ',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFD71313),
                                    )),
                                
                              ]),
                        ),
                        const Spacer(),
                        const CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.transparent,
                          backgroundImage:
                              AssetImage('assets/images/ic_launcher192.png'),
                        ),
                      ],
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    const Text(
                      'This app is basically to learn Flutter Widgets and packages and Samples with source code and description.',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 10,
                          fontWeight: FontWeight.w300
                          //color: Colors.transparent
                          ),
                    ),
                    const Spacer(
                      flex: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Theme Mode  ',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto'),
                        ),
                        const Spacer(),
                        Consumer<ThemeProvider>(
                          builder: (context, themeProvider, _) {
                            return const AnimSwitch();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ListTile(
                    leading: const Icon(Icons.info_sharp),
                    title: const Text(
                      'About Us',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AboutUs(),
                          ));
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.rate_review),
                    title: const Text(
                      'Rate Us',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                      ),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.share),
                    title: const Text(
                      'Invite Friend ',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                      ),
                    ),
                    onTap: () {
                      _shareApp();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.privacy_tip),
                    title: const Text(
                      'Privacy Policy',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PrivacyPolicy(),
                          ));
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.copyright),
                    title: const Text(
                      'Terms & Conditions',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TermsConditions(),
                          ));
                    },
                  ),
                  //const Spacer(),
                ],
              ),
            ],
          ),
        ),
        body: pages[_selectedIndex],
        bottomNavigationBar: CustomBottomNavigationBar(
          onIndexChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }

  void _shareApp() {
    const String appLink =
        "https://yourappstorelink.com"; // Replace with your app's store link

    Share.share(
      'Check out this awesome app!\n$appLink',
      subject: 'Flutter Hot Collection App',
    );
  }
}
