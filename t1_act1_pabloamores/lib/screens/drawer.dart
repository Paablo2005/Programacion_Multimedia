import 'package:flutter/material.dart';
import 'package:t1_act1_pabloamores/routes/app_routes.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
              Navigator.pushNamed(context, AppRoutes.name);
            },
          ),
          ListTile(
            title: const Text('Pantalla 2: Fotos en Fila'),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.rowPhotos);
            },
          ),
          ListTile(
            title: const Text('Pantalla 3: Fotos en Columna'),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.columnPhotos);
            },
          ),
          ListTile(
            title: const Text('Pantalla 4: Íconos'),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.icons);
            },
          ),
          ListTile(
            title: const Text('Pantalla 5: Header'),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.header);
            },
          ),
          ListTile(
            title: const Text('Pantalla 6: Filas y columnas anidadas'),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.nestedRowsColumns);
            },
          ),
          ListTile(
            title: const Text('Pantalla 7: Contador de clics'),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.clicksCount);
            },
          ),
          ListTile(
            title: const Text('Pantalla 8: Instagram'),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.miInstagram);
            },
          ),
          ListTile(
            title: const Text('Pantalla 9: Imágenes Game'),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.randomPhotos);
            },
          ),
        ],
      ),
    );
  }
}
