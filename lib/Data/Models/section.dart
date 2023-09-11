
class Section {
  final String id;
  final String category;
  final String title;
  final String subtitle;
  final String description;
  final String imagePath;
  final String sourceFilePath;
    bool isFavorite;

  //final Widget Function()? codeWidget;

  Section({
    required this.id,
    required this.category,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.imagePath,
    required this.sourceFilePath,
    required this.isFavorite,

    //required this.codeWidget
}
  );}





// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_highlight/themes/gml.dart';

// import 'package:flutter_hot/Data/Models/category.dart';
// import 'package:flutter_hot/Data/Models/section.dart';
// import 'package:flutter_hot/Routes/widget_icon_ex.dart';
// import 'package:flutter_hot/Routes/widget_text_ex.dart';

// import 'package:http/http.dart' as http;
// import 'package:flutter_highlight/flutter_highlight.dart';
// import 'package:provider/provider.dart';
// import '/../../Providers/category_provider.dart';

// class SectionPageScreen extends StatefulWidget {
//   const SectionPageScreen({Key? key}) : super(key: key);

//   @override
//   State<SectionPageScreen> createState() => _SectionPageScreenState();
// }

// class _SectionPageScreenState extends State<SectionPageScreen>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   //bool showFloatingActionButton = false;
//   //late final String _text = '';

//   //Map<String, String>? routeArgs;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(initialIndex: 0, length: 2, vsync: this);
//     //_tabController.addListener(_onTabChanged);
//     //print('_onTabChanged');

//     // Call fetchTextFromGitHub here or wherever you need to fetch the text
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     // Perform cleanup operations here (if needed)
//     super.dispose();
//   }

//   @override
//   void didChangeDependencies() {
//     // print('Fetch');

//     super.didChangeDependencies();
//   }

//   // void _onTabChanged() {
//   //   if (_tabController.index == 1) {
//   //     // The user switched to the "Code" tab
//   //     setState(() {
//   //       showFloatingActionButton = true;
//   //     });
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     //late String text = '';
//     final routArg =
//         ModalRoute.of(context)!.settings.arguments as Map<String, String>;
//     final sectionId = routArg['id'] as String;
//     final categoryId = routArg['category'] as String;
//     Category category =
//         context.watch<CategoryProvider>().findCategoryById(categoryId);
//     Section section = category.sections.firstWhere((s) => s.id == sectionId);





//     //final description = routeArgs['description'] as String?;

//     final Map<String, Widget Function()> sectionWidgets = {
//       '/widget_icon_ex': () => const WidgetIconEx(),
//       '/widget_text_ex': () => const WidgetTextEx(),
      
//       // Add more mappings for other section classes
//     };

//     Widget _selectCode(BuildContext context, String sectionNames) {
//       // Get the corresponding widget class based on the section name
//       //Navigator.of(context).pushNamed('/code_page',arguments: {'id': id,});
//       final Widget Function()? widgetBuilder = sectionWidgets[sectionNames];

//       // If the section is not mapped or the widgetBuilder is null, return a placeholder widget
//       if (widgetBuilder == null) {
//         return Container(
//           alignment: Alignment.center,
//           child: const Text('Section Not Implemented'),
//         );
//       }

//       // Build the widget using the retrieved widget class
//       return FutureBuilder<Object?>(
//         future: Future.value(
//             widgetBuilder()), // Return a completed future with the widget
//         builder: (BuildContext context, AsyncSnapshot<Object?> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const CircularProgressIndicator(); // or any other loading indicator
//           }

//           // Add your logic for other connection states
//           if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           }

//           // Return the widget built from the retrieved widget class
//           return Scaffold(
//             body: snapshot.data as Widget,
//             //backgroundColor: Theme.of(context).backgroundColor,
//           );
//         },
//       );
//     }

// //

//     Future<String> fetchTextFromGit(String sectionSourceFilePath) async {
//       try {
//         var response = await http.get(
//           Uri.parse(
//             'https://raw.githubusercontent.com/RSLDVD/flutter_hot_collection/master/lib/Routes$sectionSourceFilePath.dart',
//           ),
//         );

//         if (response.statusCode == 200) {
//           return response.body;
//         } else {
//           return 'Failed to fetch code. Status Code: ${response.statusCode}';
//         }
//       } catch (e) {
//         return 'Error occurred while fetching code: $e';
//       }
//     }

//     Widget _fetchText(
//       BuildContext context,
//       String sectionSourceFilePath,
//     ) {
//       return FutureBuilder<String>(
//         future: fetchTextFromGit(sectionSourceFilePath),
//         builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           }

//           final String text = snapshot.data ?? 'Failed to fetch code';
//           //print(text);

//           return Scaffold(
//             //backgroundColor:  Theme.of(context).scaffoldBackgroundColor,
//             body: Container(
//               color: Colors.black87,//ThemeData.dark().scaffoldBackgroundColor,
//               width: double.maxFinite,
//               height: double.maxFinite,
//               child: SingleChildScrollView(
//                 child: Stack(
//                   alignment: Alignment.center,
//                   children: [
//                     HighlightView(
//                       textStyle: const TextStyle(
//                         fontSize: 13,
//                       ),
//                       text,
//                       language: 'dart',
//                       theme: gmlTheme, //githubTheme,
//                       padding: const EdgeInsets.all(9),
//                     ),
//                     Positioned(
//                       bottom: 8,
//                       right: 8,
//                       child: ElevatedButton(
//                           onPressed: () {
//                             // Add your button logic here
//                             // For example, you can copy the text to the clipboard
//                             if(text != null){ 
//                               Clipboard.setData(ClipboardData(text: text));
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(
//                                   content: Text('Text copied to clipboard')),
//                             );}
                           
//                           },
//                           child: const Icon(
//                             Icons.copy,
//                             semanticLabel: 'Copy to Clipboard',
//                           )),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       );
//     }

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: DefaultTabController(
//         length: 2,
//         child: Scaffold(
//           appBar:
// AppBar(
//             backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
//             leading: IconButton(
//               color: Theme.of(context).appBarTheme.iconTheme!.color,
//               icon: const Icon(Icons.arrow_back),
//               onPressed: () {
//                 // Add the code to handle the back button press here
//                 // For example, you can use Navigator to pop the current route
//                 Navigator.pop(context);
//               },
//             ),
//             //backgroundColor: const Color(0xfff8ffd8),
//             title: Text(
//               section.title,
//               style: TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold,
//                 color: Theme.of(context).appBarTheme.titleTextStyle?.color,
//               ),
//             ),
//             centerTitle: true,
//             bottom: PreferredSize(
//               preferredSize: const Size.fromHeight(50),
//               child: TabBar(
//                 tabs: [
//                   Tab(
//                     icon: Icon(
//                       Icons.aod_rounded,
//                       color: Theme.of(context).appBarTheme.iconTheme?.color,
//                     ),
//                     child: Text(
//                       'View',
//                       style: TextStyle(
//                         fontSize: 15,
//                         color:
//                             Theme.of(context).appBarTheme.titleTextStyle?.color,
//                       ),
//                     ),
//                   ),
//                   Tab(
//                     icon: Icon(
//                       Icons.source,
//                       color: Theme.of(context).appBarTheme.iconTheme?.color,
//                     ),
//                     child: Text(
//                       'Code',
//                       style: TextStyle(
//                         fontSize: 15,
//                         color:
//                             Theme.of(context).appBarTheme.titleTextStyle?.color,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           body: TabBarView(
//             dragStartBehavior: DragStartBehavior.down,
//             //controller: _tabController,
//             children: [
//               _selectCode(context, section.sourceFilePath,),
//               _fetchText(context, section.sourceFilePath),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
