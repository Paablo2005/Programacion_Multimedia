import 'package:t1_act1_pabloamores/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drawer Navigation App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/screens/random_photos': (context) => const RandomPhotosScreen(),
        '/screens/home_screen': (context) => const HomeScreen(),
        '/screens/row_photos_screen': (context) => const RowPhotosScreen(),
        '/screens/nested_rows_and_columns_screen': (context) =>
            const NestedRowsAndColumnsScreen(),
        '/screens/name_screen': (context) => const NameScreen(),
        '/screens/icons_screen': (context) => const IconsScreen(),
        '/screens/header_screen': (context) => const HeaderScreen(),
        '/screens/drawer': (context) => const MyDrawer(),
        '/screens/column_photos_screen': (context) =>
            const ColumnPhotosScreen(),
        '/screens/clicks_count': (context) => const MiContador(),
        '/screens/instagram/mi_instagram': (context) => const MiInstagram(),
        '/screens/instagram/instagram': (context) => const Instagram(),
      },
    );
  }
}
