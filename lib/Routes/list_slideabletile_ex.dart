//Make sure you have the flutter_slidable package added to your pubspec.yaml
//dependencies:
//  flutter:
//    sdk: flutter
//  flutter_slidable: ^2.0.0
//
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableTileEx extends StatefulWidget {
  const SlidableTileEx({super.key});

  @override
  _SlidableTileExState createState() => _SlidableTileExState();
}

class _SlidableTileExState extends State<SlidableTileEx> {
  static final _kActionPaneTypes = <String, Widget>{
    'DrawerMotion': const DrawerMotion(),
    'BehindMotion': const BehindMotion(),
    'ScrollMotion': const ScrollMotion(),
    'StretchMotion': const StretchMotion(),
  };
  late List<Slidable> _items;

  @override
  void initState() {
    super.initState();
    final mainActions = <Widget>[
      SlidableAction(
        label: 'Archive',
        foregroundColor: Colors.blue,
        icon: Icons.archive,
        onPressed: (_) => _showSnackBar('Archive'),
      ),
      SlidableAction(
        label: 'Share',
        foregroundColor: Colors.indigo,
        icon: Icons.share,
        onPressed: (_) => _showSnackBar('Share'),
        autoClose: false, // Don't automatically close.
      ),
    ];
    final secondaryActions = <Widget>[
      SlidableAction(
        label: 'More',
        foregroundColor: Colors.black45,
        icon: Icons.more_horiz,
        onPressed: (_) => _showSnackBar('More'),
      ),
      SlidableAction(
        label: 'Delete',
        foregroundColor: Colors.red,
        icon: Icons.delete,
        onPressed: (_) => _showSnackBar('Delete'),
      ),
    ];
    _items = [
      for (final entry in _kActionPaneTypes.entries)
        Slidable(
          key: ValueKey(entry.key),
          startActionPane: ActionPane(
            motion: entry.value,
            extentRatio: 0.2,
            children: mainActions,
          ),
          endActionPane: ActionPane(
            motion: entry.value,
            extentRatio: 0.2,
            children: secondaryActions,
          ),
          child: ListTile(
            leading: const Icon(Icons.swipe),
            title: Text('ListTile with ${entry.key}'),
            subtitle: const Text('Swipe left and right to see the actions'),
          ),
        ),
    ];
    // Dismissible tile example:
    final dismissal = DismissiblePane(
      onDismissed: () {
        _showSnackBar('Dismiss Archive');
        setState(() => _items.removeAt(_items.length - 1));
      },
      confirmDismiss: () async {
        final bool? ret = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Archive'),
              content: const Text('Confirm action?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('Ok'),
                ),
              ],
            );
          },
        );
        return ret ?? false;
      },
    );
    _items.add(
      Slidable(
        key: const Key('dismissibleTile'),
        startActionPane: ActionPane(
          motion: const DrawerMotion(),
          dismissible: dismissal,
          children: [mainActions[0]], // 'Archive' action
        ),
        endActionPane: ActionPane(
          motion: const DrawerMotion(),
          children: [secondaryActions[1]], // 'Delete' action
        ),
        child: const ListTile(
          leading: Icon(Icons.swap_horiz),
          title: Text('Dismissible tile'),
          subtitle: Text('Swipe right to archive, swipe left to delete'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: _items);
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
