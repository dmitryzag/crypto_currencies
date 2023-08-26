import 'package:flutter/material.dart';

final theme = ThemeData(
  primarySwatch: Colors.amber,
  cardTheme: const CardTheme(color: Color.fromARGB(255, 184, 140, 5)),
  dividerColor: Colors.white24,
  scaffoldBackgroundColor: const Color.fromARGB(255, 32, 31, 31),
  listTileTheme:
      const ListTileThemeData(textColor: Colors.white, iconColor: Colors.white),
  textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 20,
      ),
      labelSmall: TextStyle(
        color: Color.fromARGB(106, 255, 255, 255),
        fontWeight: FontWeight.w500,
        fontSize: 14,
      )),
  appBarTheme: const AppBarTheme(
      elevation: 3,
      backgroundColor: Color.fromARGB(255, 184, 140, 5),
      shadowColor: Colors.amber,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: Colors.white),
      centerTitle: true),
);
