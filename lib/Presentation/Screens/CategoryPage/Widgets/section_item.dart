import 'package:flutter/material.dart';
import 'package:flutter_mastery/Providers/category_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mastery/constant.dart';

class SectionItem extends StatelessWidget {
  final String id;
  final String category;
  final int index;
  final String title;
  final String subtitle;
  final String description;
  final String imagePath;
  final String sourceFilePath;
  final bool isFavorite;

  const SectionItem(
      {Key? key,
      required this.id,
      required this.category,
      required this.index,
      required this.title,
      required this.subtitle,
      required this.description,
      required this.imagePath,
      required this.sourceFilePath,
      required this.isFavorite})
      : super(key: key);

  void _selectSection(BuildContext context) {
    // ignore: avoid_print
    print('Tapped on section item: $title');
    Navigator.pushNamed(
      context,
      '/section_page',
      arguments: {
        'id': id,
        'category': category,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ListTile(
          isThreeLine: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          //minLeadingWidth: 200,

          leading: CircleAvatar(
            backgroundColor: colors[index],
            radius: 20,
            child: Text(
              '${index + 1}',
              style: const TextStyle(
                  fontFamily: 'OpenSansCondensed',
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          title: Text(
            title,
            style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).appBarTheme.titleTextStyle?.color),
          ),
          subtitle: Text(subtitle,
              style: const TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 12,
              )),
          trailing: IconButton(
            icon: Consumer<CategoryProvider>(
              builder: (c, categoryProvider, _) {
                return SvgPicture.asset(
                  isFavorite
                      ? 'assets/icons/bookmark-fill.svg'
                      : 'assets/icons/bookmark-border.svg',
                  width: 24,
                  height: 24,
                  color: isFavorite 
                  ? const Color(0xFFFFD93D) 
                  : Theme.of(context).appBarTheme.iconTheme?.color,
                );
              },
            ),
            onPressed: () async {
              await Provider.of<CategoryProvider>(context, listen: false)
                  .toggleSectionFavorite(id, category);
            },
          ),
        ),
      ),
      onTap: () {
        _selectSection(context);
      },
    );
  }
}
