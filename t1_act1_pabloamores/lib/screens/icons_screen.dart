import 'package:flutter/material.dart';
// Importación de las pantallas necesarias desde 'screens.dart'
import 'package:t1_act1_pabloamores/screens/screens.dart';

// Definición de un widget Stateless llamado IconsScreen
class IconsScreen extends StatelessWidget {
  const IconsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Método build que construye la UI del widget
    return Scaffold(
      // AppBar para mostrar el encabezado de la pantalla
      appBar: AppBar(
        title: const Text('Íconos'), // Título de la pantalla
      ),
      // Drawer con el menú de navegación
      drawer: const MyDrawer(),
      // Cuerpo de la pantalla, utilizando un Row para organizar los iconos en una fila
      body: const Row(
        mainAxisAlignment: MainAxisAlignment
            .spaceAround, // Distribuye los iconos de manera equitativa con espacio entre ellos
        children: [
          // Varios iconos con un tamaño de 50
          Icon(Icons.home, size: 50), // Ícono de la casa
          Icon(Icons.star, size: 50), // Ícono de la estrella
          Icon(Icons.person, size: 50), // Ícono de la persona
          Icon(Icons.settings, size: 50), // Ícono de configuración
          Icon(Icons.phone, size: 50), // Ícono del teléfono
        ],
      ),
    );
  }
}
