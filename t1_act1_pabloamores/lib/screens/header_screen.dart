import 'package:flutter/material.dart';
// Importación de las pantallas necesarias desde 'screens.dart'
import 'package:t1_act1_pabloamores/screens/screens.dart';

// Definición de un widget Stateless llamado HeaderScreen
class HeaderScreen extends StatelessWidget {
  const HeaderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Método build que construye la UI del widget
    return Scaffold(
      // AppBar para mostrar el encabezado de la pantalla
      appBar: AppBar(
        title: const Text('Header Screen'), // Título de la pantalla
      ),
      // Drawer con el menú de navegación
      drawer: const MyDrawer(),
      body: Container(
        // Usamos un Container para crear un área de fondo personalizada
        height: 130, // Altura del contenedor
        width:
            double.infinity, // Ancho que se extiende a todo el ancho disponible
        decoration: const BoxDecoration(
          // Establece el color de fondo del contenedor
          color: Color(0xFF57B3FC),
          // BorderRadius para redondear las esquinas inferiores del contenedor
          borderRadius: BorderRadius.only(
            bottomRight:
                Radius.circular(50), // Esquina inferior derecha redondeada
            bottomLeft:
                Radius.circular(50), // Esquina inferior izquierda redondeada
          ),
          // Sombra que agrega un efecto de profundidad al contenedor
          boxShadow: [
            BoxShadow(
              color: Color(0xAA6EB1E6), // Color de la sombra
              offset: Offset(9, 9), // Desplazamiento de la sombra
              blurRadius: 6, // Difusión de la sombra
            ),
          ],
        ),
        alignment: Alignment.center, // Centra el texto dentro del contenedor
        child: const Text(
          'I am a header', // Texto que se muestra en el contenedor
          style: TextStyle(
            fontSize: 38, // Tamaño del texto
            color: Colors.white, // Color del texto
          ),
        ),
      ),
    );
  }
}
