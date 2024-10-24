import 'package:flutter/material.dart';
import 'package:t1_act1_pabloamores/screens/clicks_count.dart';
import 'package:t1_act1_pabloamores/screens/header_screen.dart';
import 'package:t1_act1_pabloamores/screens/nested_rows_and_columns_screen.dart';
import 'package:t1_act1_pabloamores/screens/name_screen.dart';
import 'package:t1_act1_pabloamores/screens/row_photos_screen.dart';
import 'package:t1_act1_pabloamores/screens/column_photos_screen.dart';
import 'package:t1_act1_pabloamores/screens/icons_screen.dart';

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
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer Navigation App'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menú de navegación',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: const Text('Pantalla 1: Nombre y Repositorio'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NameScreen()),
                );
              },
            ),
            ListTile(
              title: const Text('Pantalla 2: Fotos en Fila'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RowPhotosScreen()),
                );
              },
            ),
            ListTile(
              title: const Text('Pantalla 3: Fotos en Columna'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ColumnPhotosScreen()),
                );
              },
            ),
            ListTile(
              title: const Text('Pantalla 4: Íconos'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const IconsScreen()),
                );
              },
            ),
            ListTile(
              title: const Text('Pantalla 5: Header'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HeaderScreen()),
                );
              },
            ),
            ListTile(
              title: const Text('Pantalla 6: Filas y columnas anidadas'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NestedRowsAndColumnsScreen()),
                );
              },
            ),
            ListTile(
              title: const Text('Pantalla 7: Contador de clics'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MiContador()),
                );
              },
            ),
          ],
        ),
      ),
      body: const Center(child: Text('Selecciona una opción en el Drawer')),
    );
  }
}
