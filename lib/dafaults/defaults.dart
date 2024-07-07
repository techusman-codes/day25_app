import 'package:flutter/material.dart';

class Defaults {
  static const Color drawerItemColor = Colors.blueGrey;
  static const Color drawerItemSelectedColor = Colors.blue;
  static const Color drawerSelectedTileColor =
      Color.fromARGB(255, 169, 209, 241);
  static final drawerItemText = [
    'Inbox',
    'Starred',
    'Sent',
    'Drafts',
    'Trash',
    'Spam',
  ];

  static final drawerItemIcon = [
    Icons.inbox,
    Icons.star,
    Icons.send,
    Icons.mail,
    Icons.delete,
    Icons.warning_rounded,
  ];
}
