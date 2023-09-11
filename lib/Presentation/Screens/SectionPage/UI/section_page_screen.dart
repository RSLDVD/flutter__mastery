import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_highlight/themes/a11y-light.dart';
import 'package:flutter_mastery/Action/anim_switch.dart';
import 'package:flutter_mastery/Providers/theme_provider.dart';
import 'package:flutter_mastery/Routes/animation_advanced3danimation_ex.dart';
import 'package:flutter_mastery/Routes/animation_advancedcurvedanimation_ex.dart';
import 'package:flutter_mastery/Routes/animation_advancedgestureanimation_ex.dart';
import 'package:flutter_mastery/Routes/animation_advancedphysicsanimation_ex.dart';
import 'package:flutter_mastery/Routes/animation_basicanimations_ex.dart';
import 'package:flutter_mastery/Routes/animation_customanimatedwidget_ex.dart';
import 'package:flutter_mastery/Routes/animation_customanimationcontroller_ex.dart';
import 'package:flutter_mastery/Routes/animation_custompainteranimation_ex.dart';
import 'package:flutter_mastery/Routes/animation_gridstaggeredanimation_ex.dart';
import 'package:flutter_mastery/Routes/animation_heroanimation_ex.dart';
import 'package:flutter_mastery/Routes/animation_liststaggeredanimation_ex.dart';
import 'package:flutter_mastery/Routes/animation_tweenanimation_ex.dart';
import 'package:flutter_mastery/Routes/animation_tweenbuilderanimation_ex.dart';
import 'package:flutter_mastery/Routes/appbar_basicappbar_ex.dart';
import 'package:flutter_mastery/Routes/appbar_bottomappbar_ex.dart';
import 'package:flutter_mastery/Routes/appbar_cupertinonavigationbar_ex.dart';
import 'package:flutter_mastery/Routes/appbar_cupertinoslivernavigationbar_ex.dart';
import 'package:flutter_mastery/Routes/appbar_persistentappbar_ex.dart';
import 'package:flutter_mastery/Routes/appbar_sliverappbar_ex.dart';
import 'package:flutter_mastery/Routes/list_datatable_ex.dart';
import 'package:flutter_mastery/Routes/list_expansiontile_ex.dart';
import 'package:flutter_mastery/Routes/list_gridview_ex.dart';
import 'package:flutter_mastery/Routes/list_listtile_ex.dart';
import 'package:flutter_mastery/Routes/list_listviewbuilder_ex.dart';
import 'package:flutter_mastery/Routes/list_reorderablelist_ex.dart';
import 'package:flutter_mastery/Routes/list_listwheelview_ex.dart';
import 'package:flutter_mastery/Routes/list_slideabletile_ex.dart';
import 'package:flutter_mastery/Routes/navigation_bottomnavigationbar_ex.dart';
import 'package:flutter_mastery/Routes/navigation_drawer_ex.dart';
import 'package:flutter_mastery/Routes/navigation_floatingactionbutton_ex.dart';
import 'package:flutter_mastery/Routes/navigation_navigatormethod_ex.dart';
import 'package:flutter_mastery/Routes/navigation_pageroutebuilder_ex.dart';
import 'package:flutter_mastery/Routes/navigation_tabbars_ex.dart';
import 'package:flutter_mastery/Routes/statemanagement_bloc_ex.dart';
import 'package:flutter_mastery/Routes/statemanagement_getx_ex.dart';
import 'package:flutter_mastery/Routes/statemanagement_inheritedwidget_ex.dart';
import 'package:flutter_mastery/Routes/statemanagement_provider_ex.dart';
import 'package:flutter_mastery/Routes/statemanagement_redux_ex.dart';
import 'package:flutter_mastery/Routes/statemanagement_riverpod_ex.dart';
import 'package:flutter_mastery/Routes/statemanagement_setstate_ex.dart';
import 'package:flutter_svg/flutter_svg.dart';
//
import 'package:provider/provider.dart';
import '/../../Providers/category_provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_highlight/flutter_highlight.dart';
//
import 'package:flutter_highlight/themes/solarized-dark.dart';
//
import 'package:flutter_mastery/Data/Models/category.dart';
import 'package:flutter_mastery/Data/Models/section.dart';
//
import 'package:flutter_mastery/Routes/widget_checkbox_ex.dart';
import 'package:flutter_mastery/Routes/widget_chip_ex.dart';
import 'package:flutter_mastery/Routes/widget_dropdown_ex.dart';
import 'package:flutter_mastery/Routes/widget_icon_ex.dart';
import 'package:flutter_mastery/Routes/widget_radio_ex.dart';
import 'package:flutter_mastery/Routes/widget_scaffold_ex.dart';
import 'package:flutter_mastery/Routes/widget_switch_ex.dart';
import 'package:flutter_mastery/Routes/widget_text_ex.dart';
import 'package:flutter_mastery/Routes/widget_card_ex.dart';
import 'package:flutter_mastery/Routes/widget_expansionpanellist_ex.dart';
import 'package:flutter_mastery/Routes/widget_slider_ex.dart';
import 'package:flutter_mastery/Routes/widget_stateless_ex.dart';
import 'package:flutter_mastery/Routes/widget_container_ex.dart';
import 'package:flutter_mastery/Routes/widget_dialogs_ex.dart';
import 'package:flutter_mastery/Routes/widget_placeholder_ex.dart';
import 'package:flutter_mastery/Routes/widget_stack_ex.dart';
import 'package:flutter_mastery/Routes/widget_stateful_ex.dart';
import 'package:flutter_mastery/Routes/widget_rowcolumn_ex.dart';
import 'package:flutter_mastery/Routes/widget_stepper_ex.dart';
import 'package:flutter_mastery/Routes/widget_textformfield_ex.dart';

enum TabType {
  view,
  code,
  description,
}

class SectionPageScreen extends StatefulWidget {
  const SectionPageScreen({Key? key}) : super(key: key);

  @override
  State<SectionPageScreen> createState() => _SectionPageScreenState();
}

class _SectionPageScreenState extends State<SectionPageScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  double codeFontSize = 12;

  final Map<String, Widget Function()> sectionWidgets = {
    '/widget_icon_ex': () => const WidgetIconEx(),
    '/widget_text_ex': () => const WidgetTextEx(),
    '/widget_checkbox_ex': () => const WidgetCheckBoxEx(),
    '/widget_switch_ex': () => const WidgetSwitchEx(),
    '/widget_radio_ex': () => const WidgetRadioEx(),
    '/widget_dropdown_ex': () => const WidgetDropDownEx(),
    '/widget_chip_ex': () => const WidgetChipEx(),
    '/widget_scaffold_ex': () => const WidgetScaffoldEx(),
    '/widget_stateless_ex': () => const WidgetStatelessEx(),
    '/widget_stateful_ex': () => const WidgetStatefulEx(),
    '/widget_container_ex': () => const WidgetContainerEx(),
    '/widget_rowcolumn_ex': () => WidgetRowColumnEx(),
    '/widget_stack_ex': () => const WidgetStackEx(),
    '/widget_placeholder_ex': () => const WidgetPlaceHolderEx(),
    '/widget_dialogs_ex': () => const WidgetDialogsEx(),
    '/widget_stepper_ex': () => const WidgetStepperEx(),
    '/widget_slider_ex': () => const WidgetSliderEx(),
    '/widget_card_ex': () => const WidgetCardEx(),
    '/widget_expansionpanellist_ex': () => const WidgetExpansionPanelListEx(),
    '/widget_textformfield_ex': () => WidgetTextFormFieldEx(),
    '/list_listtile_ex': () => const ListTileEx(),
    '/list_listviewbuilder_ex': () => const ListViewBuilderEx(),
    '/list_gridview_ex': () => GridViewEx(),
    '/list_expansiontile_ex': () => const ExpansionTileEx(),
    '/list_reorderablelist_ex': () => const ReorderableListEx(),
    '/list_listwheelview_ex': () => const ListWheelViewEx(),
    '/list_slideabletile_ex': () => const SlidableTileEx(),
    '/list_datatable_ex': () => DataTableEx(),
    '/appbar_basicappbar_ex': () => BasicAppBarEx(),
    '/appbar_sliverappbar_ex': () => SliverAppBarEx(),
    '/appbar_bottomappbar_ex': () => const BottomAppBarEx(),
    '/appbar_persistentappbar_ex': () => const PersistentAppBarEx(),
    '/appbar_cupertinonavigationbar_ex': () => CupertinoNavigationBarEx(),
    '/appbar_cupertinoslivernavigationbar_ex': () =>
        CupertinoSliverNavigationBarEx(),
    '/navigation_bottomnavigationbar_ex': () => BottomNavigationBarEx(),
    '/navigation_tabbars_ex': () => TabBarScreenEx(),
    '/navigation_drawer_ex': () => DrawerScreenEx(),
    '/navigation_floatingactionbutton_ex': () => FloatingActionButtonScreenEX(),
    '/navigation_pageroutebuilder_ex': () => PageRouteBuilderEx(),
    '/navigation_navigatormethod_ex': () => NavigationMethodsEx(),
    '/animation_basicanimations_ex': () => const BasicAnimationsEx(),
    '/animation_liststaggeredanimation_ex': () => ListStaggeredAnimationsEx(),
    '/animation_gridstaggeredanimation_ex': () => GridStaggeredAnimationsEx(),
    '/animation_tweenanimation_ex': () => TweenAnimationsEx(),
    '/animation_tweenbuilderanimation_ex': () => TweenBuilderAnimationEx(),
    '/animation_heroanimation_ex': () => HeroAnimationEx(),
    '/animation_custompainteranimation_ex': () => CustomPainterAnimationEX(),
    '/animation_customanimationcontroller_ex': () =>
        CustomAnimationControllerEx(),
    '/animation_customanimatedwidget_ex': () => CustomAnimatedWidgetEx(),
    '/animation_advancedcurvedanimation_ex': () => AdvancedCurvedAnimationEx(),
    '/animation_advancedphysicsanimation_ex': () =>
        AdvancedPhysicsAnimationEx(),
    '/animation_advanced3danimation_ex': () => const Advanced3DAnimationEx(),
    '/animation_advancedgestureanimation_ex': () =>
        AdvancedGestureAnimationEx(),
        '/statemanagement_setstate_ex': () =>
        SetstateEx(),
        '/statemanagement_inheritedwidget_ex': () =>
        const InheritedWidgetEx(),
        '/statemanagement_provider_ex': () =>
        ProviderEx(),
        '/statemanagement_bloc_ex': () =>
        BlocEx(),
        '/statemanagement_getx_ex': () =>
        GetxEx(),
         '/statemanagement_riverpod_ex': () =>
        RiverpodEx(),
        '/statemanagement_redux_ex': () =>
        ReduxEx(),


  };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildTabContent(
    BuildContext context,
    String sectionSourceNames,
    //bool isViewTab,
    TabType tapType,
    String description,
  ) {
    final Widget Function()? widgetBuilder = sectionWidgets[sectionSourceNames];

    if (widgetBuilder == null) {
      return Container(
        alignment: Alignment.center,
        child: const Text('Section Not Implemented'),
      );
    }
    //
    switch (tapType) {
      case TabType.view:
        return widgetBuilder();
      case TabType.code:
        return FutureBuilder<String>(
          future: fetchTextFromGit(sectionSourceNames),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(
                      color: Colors.black));
            }

            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            final String codeText = snapshot.data ?? 'Failed to fetch code';

            return Scaffold(
              //backgroundColor:  Theme.of(context).scaffoldBackgroundColor,
              body: Container(
                color: Provider.of<ThemeProvider>(context).isDarkMode
                    ? Colors.black87
                    : Colors.white, //ThemeData.dark().scaffoldBackgroundColor,
                width: double.maxFinite,
                height: double.maxFinite,
                child: SingleChildScrollView(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      HighlightView(
                        textStyle: TextStyle(
                          //fontFamily: 'OpenSansCondensed',
                          fontSize: codeFontSize,
                        ),
                        codeText,
                        language: 'dart',
                        theme: Provider.of<ThemeProvider>(context).isDarkMode
                            ? solarizedDarkTheme
                            : a11yLightTheme, //githubTheme,
                        padding:
                            const EdgeInsets.only(top: 50, right: 15, left: 20),
                      ),
                      Positioned(
                        top: 0,
                        right: 2,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                shape:
                                    MaterialStateProperty.all<OutlinedBorder>(
                                  const CircleBorder(),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black38)),
                            onPressed: () {
                              Clipboard.setData(ClipboardData(text: codeText));
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    backgroundColor: Colors.amber,
                                    content: Text(
                                      'Text copied to clipboard',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'OpenSansCondensed',
                                      ),
                                    )),
                              );
                            },
                            child: Icon(
                              Icons.file_copy_sharp,
                              semanticLabel: 'Copy to Clipboard',
                              color: Theme.of(context)
                                  .appBarTheme
                                  .iconTheme
                                  ?.color,
                            )),
                      ),
                      Positioned(
                        left: 2,
                        top: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        OutlinedBorder>(
                                      const CircleBorder(),
                                    ),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.black87)),
                                onPressed: () {
                                  setState(() {
                                    codeFontSize--;
                                  });
                                },
                                child: Icon(
                                  Icons.zoom_out_sharp,
                                  color: Theme.of(context)
                                      .appBarTheme
                                      .iconTheme
                                      ?.color,
                                )),
                            ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        OutlinedBorder>(
                                      const CircleBorder(),
                                    ),
                                    backgroundColor: MaterialStateProperty.all<
                                            Color>(
                                        Colors.black87)),
                                onPressed: () {
                                  setState(() {
                                    codeFontSize++;
                                  });
                                },
                                child: Icon(
                                  Icons.zoom_in_sharp,
                                  color: Theme.of(context)
                                      .appBarTheme
                                      .iconTheme
                                      ?.color,
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );

      case TabType.description:
        return Container(
          height: double.infinity,
          color: Theme.of(context).scaffoldBackgroundColor,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                description,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                  color: Theme.of(context).appBarTheme.titleTextStyle?.color,
                ),
              ),
            ),
          ),
        );
    }
  }

  Future<String> fetchTextFromGit(String sectionSourceFilePath) async {
    try {
      var response = await http.get(
        Uri.parse(
          'https://raw.githubusercontent.com/RSLDVD/flutter_hot_collection/master/lib/Routes$sectionSourceFilePath.dart',
        ),
      );

      if (response.statusCode == 200) {
        return response.body;
      } else {
        return 'Failed to fetch code. Status Code: ${response.statusCode}';
      }
    } catch (e) {
      return 'Error occurred while fetching code: $e';
    }
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final sectionId = routeArgs['id'] as String;
    final categoryId = routeArgs['category'] as String;
    Category category =
        context.watch<CategoryProvider>().findCategoryById(categoryId);
    Section section = category.sections.firstWhere((s) => s.id == sectionId);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            leading: IconButton(
              color: Theme.of(context).appBarTheme.iconTheme!.color,
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 1, 10, 0),
                child: Consumer<ThemeProvider>(
                  builder: (context, themeProvider, _) {
                    return const AnimSwitch();
                  },
                ),
              )
            ],
            title: Text(
              section.title,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).appBarTheme.titleTextStyle?.color,
              ),
            ),
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: TabBar(
                tabs: [
                  Tab(
                    icon: Icon(
                      size: 18,
                      Icons.phone_android,
                      color: Theme.of(context).appBarTheme.iconTheme?.color,
                    ),
                    child: Text(
                      'View',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color:
                            Theme.of(context).appBarTheme.titleTextStyle?.color,
                      ),
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.code,
                      size: 18,
                      color: Theme.of(context).appBarTheme.iconTheme?.color,
                    ),
                    child: Text(
                      'Code',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color:
                            Theme.of(context).appBarTheme.titleTextStyle?.color,
                      ),
                    ),
                  ),
                  Tab(
                    icon: SvgPicture.asset(
                      'assets/icons/comment.svg',
                      width: 25,
                      height: 25,
                      color: Theme.of(context).appBarTheme.iconTheme?.color,
                    ),
                    child: Text(
                      'Description',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color:
                            Theme.of(context).appBarTheme.titleTextStyle?.color,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            //controller: _tabController,
            dragStartBehavior: DragStartBehavior.down,
            children: [
              _buildTabContent(context, section.sourceFilePath, TabType.view,
                  section.description), // View tab
              _buildTabContent(context, section.sourceFilePath, TabType.code,
                  section.description),
              _buildTabContent(context, '/widget_icon_ex', TabType.description,
                  section.description),
              // Code tab
            ],
          ),
        ),
      ),
    );
  }
}
