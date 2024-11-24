import 'package:flutter/material.dart';
import '../screens/screens.dart';

class AppRoutes {
  static const String clicksCount = '/clicks_count';
  static const String columnPhotos = '/column_photos';
  static const String rowPhotos = '/row_photos';
  static const String drawer = '/drawer';
  static const String header = '/header';
  static const String home = '/home';
  static const String icons = '/icons';
  static const String name = '/name';
  static const String nestedRowsColumns = '/nested_rows_columns';
  static const String randomPhotos = '/random_photos';
  static const String miInstagram = '/mi_instagram';
  static const String instagram = '/instagram';
  static const String statColumn = '/stat_column';
  static const String storyCircle = '/story_circle';
  static const String gameInstructions = '/game_instructions';

  static final Map<String, WidgetBuilder> routes = {
    clicksCount: (context) => const MiContador(),
    columnPhotos: (context) => const ColumnPhotosScreen(),
    rowPhotos: (context) => const RowPhotosScreen(),
    drawer: (context) => const MyDrawer(),
    header: (context) => const HeaderScreen(),
    home: (context) => const HomeScreen(),
    icons: (context) => const IconsScreen(),
    name: (context) => const NameScreen(),
    nestedRowsColumns: (context) => const NestedRowsAndColumnsScreen(),
    randomPhotos: (context) => const RandomPhotosScreen(),
    miInstagram: (context) => const MiInstagram(),
    instagram: (context) => const Instagram(),
    gameInstructions: (context) => const GameInstructions(),
  };
}
