import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//
import 'package:flutter_mastery/Data/Models/category.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../../Providers/category_provider.dart';
import 'category_item.dart';

class CategoryGridViewBuilder extends StatelessWidget {
  const CategoryGridViewBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Category> categories = context.watch<CategoryProvider>().categoryData;

    return AnimationLimiter(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 250,
          childAspectRatio: 8 / 11,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) => AnimationConfiguration.staggeredList(
          position: index,
          duration: const Duration(milliseconds: 277),
          child: SlideAnimation(
            curve: Curves.bounceOut,
            horizontalOffset: 50.0,
            verticalOffset: 0,
            child: FadeInAnimation(
              child: CategoryItem(
                id: categories[index].id,
                title: categories[index].title,
                subtitle: categories[index].subtitle.toList(),
                imagePath: categories[index].imagePath,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
