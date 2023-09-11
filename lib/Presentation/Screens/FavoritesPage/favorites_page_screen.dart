import 'package:flutter/material.dart';
import 'package:flutter_mastery/Data/Models/section.dart';
import 'package:flutter_mastery/Presentation/Screens/CategoryPage/Widgets/section_item.dart';
import 'package:flutter_mastery/Providers/category_provider.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

class FavoritesPageScreen extends StatelessWidget {
  const FavoritesPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Section> favoriteSections =
        Provider.of<CategoryProvider>(context).favoriteSections;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 35,
        title: const Text(
          'Favorites ',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 277),
            child: SlideAnimation(
              curve: Curves.easeInCirc,
              //verticalOffset: 20.0,
              horizontalOffset: 50.0,
              child: FadeInAnimation(
                child: Column(
                  children: [
                    SectionItem(
                        id: favoriteSections[index].id,
                        category: favoriteSections[index].category,
                        index: index,
                        title: favoriteSections[index].title,
                        subtitle: favoriteSections[index].subtitle,
                        description: favoriteSections[index].description,
                        imagePath: favoriteSections[index].imagePath,
                        sourceFilePath: favoriteSections[index].sourceFilePath,
                        isFavorite: favoriteSections[index].isFavorite),
                    const Divider(
                      thickness: 1,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: favoriteSections.length,
      ),
    );
  }
}
