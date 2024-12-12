import 'package:flutter/material.dart';

// Importación de rutas definidas en otro archivo (app_routes.dart)
import 'package:t1_act1_pabloamores/routes/app_routes.dart';

// Definición de un widget Stateless llamado MyDrawer
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // Método build que construye la UI del widget
    return Drawer(
      // Drawer es un panel lateral que se desliza desde el borde izquierdo de la pantalla
      child: ListView(
        // ListView se usa para crear una lista desplazable de elementos
        padding:
            EdgeInsets.zero, // Elimina el padding predeterminado de la lista
        children: <Widget>[
          // Primer elemento: un DrawerHeader (cabecera del menú)
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue, // Color de fondo del encabezado
            ),
            child: Text(
              'Menú de navegación', // Título que aparece en el encabezado
              style: TextStyle(
                  color: Colors.white, fontSize: 24), // Estilo del texto
            ),
          ),
          // ListTile: un ítem de menú que permite navegar a una nueva pantalla
          ListTile(
            title: const Text('Pantalla 1: Nombre y Repositorio'),
            onTap: () {
              // Al hacer clic en este ítem, se navega a la pantalla correspondiente
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
              Navigator.pushNamed(context, AppRoutes.gameInstructions);
            },
          ),
          ListTile(
            title: const Text('Pantalla 10: Siete y media'),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.sieteYMedia);
            },
          ),
          ListTile(
            title: const Text('Pantalla 11: Formularios (No duales)'),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.formulariosNoDual);
            },
          ),
          ListTile(
            title: const Text('Pantalla 12: Formularios (swich)'),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.formulariosSwich);
            },
          ),
        ],
      ),
    );
  }
}
