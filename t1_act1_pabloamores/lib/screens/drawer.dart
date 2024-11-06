import 'package:t1_act1_pabloamores/screens/screens.dart';

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
              Navigator.pushNamed(context, '/screens/name_screen');
            },
          ),
          ListTile(
            title: const Text('Pantalla 2: Fotos en Fila'),
            onTap: () {
              Navigator.pushNamed(context, '/screens/row_photos_screen');
            },
          ),
          ListTile(
            title: const Text('Pantalla 3: Fotos en Columna'),
            onTap: () {
              Navigator.pushNamed(context, '/screens/column_photos_screen');
            },
          ),
          ListTile(
            title: const Text('Pantalla 4: Íconos'),
            onTap: () {
              Navigator.pushNamed(context, '/screens/icons_screen');
            },
          ),
          ListTile(
            title: const Text('Pantalla 5: Header'),
            onTap: () {
              Navigator.pushNamed(context, '/screens/header_screen');
            },
          ),
          ListTile(
            title: const Text('Pantalla 6: Filas y columnas anidadas'),
            onTap: () {
              Navigator.pushNamed(
                  context, '/screens/nested_rows_and_columns_screen');
            },
          ),
          ListTile(
            title: const Text('Pantalla 7: Contador de clics'),
            onTap: () {
              Navigator.pushNamed(context, '/screens/clicks_count');
            },
          ),
          ListTile(
            title: const Text('Pantalla 8: Instagram'),
            onTap: () {
              Navigator.pushNamed(context, '/screens/instagram/mi_instagram');
            },
          ),
          ListTile(
            title: const Text('Pantalla 9: Imagenes Game'),
            onTap: () {
              Navigator.pushNamed(context, '/screens/random_photos');
            },
          )
        ],
      ),
    );
  }
}
