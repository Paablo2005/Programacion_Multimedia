// Importación de paquetes necesarios
import 'package:t1_act1_pabloamores/routes/app_routes.dart'; // Rutas de la aplicación
import 'package:flutter/material.dart'; // Framework de Flutter

// Función principal que ejecuta la aplicación
void main() {
  runApp(const MyApp());
}

// Clase que define el widget principal de la aplicación
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Título de la aplicación que aparecerá en el sistema
      title: 'Drawer Navigation App',

      // Definición del tema de la aplicación
      theme: ThemeData(
        brightness:
            Brightness.light, // Establece el brillo del tema (oscuro o claro)
        primaryColor: Colors.blue, // Color principal de la aplicación
        scaffoldBackgroundColor:
            Colors.grey[200], // Color de fondo de las pantallas (Scaffold)

        // Estilos para el texto de la aplicación
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
              color: Colors.black87,
              fontSize: 16), // Estilo para el cuerpo de texto grande
          bodyMedium: TextStyle(
              color: Colors.black54,
              fontSize: 14), // Estilo para el cuerpo de texto medio
          titleLarge: TextStyle(
              color: Colors.blueAccent, // Color para los títulos grandes
              fontSize: 20, // Tamaño de fuente para los títulos grandes
              fontWeight: FontWeight
                  .bold), // Peso de la fuente para los títulos grandes
        ),

        // Estilo para la AppBar (barra superior)
        appBarTheme: const AppBarTheme(
          color: Colors.blueAccent, // Color de la barra de la app
          elevation: 4, // Elevación de la barra de la app (sombra)
          titleTextStyle: TextStyle(
            color: Colors.white, // Color del texto del título de la AppBar
            fontSize: 22, // Tamaño del texto del título
            fontWeight: FontWeight.bold, // Peso del texto del título
          ),
        ),

        // Estilo para los botones elevados (ElevatedButton)
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white, // Color de fondo del botón
            foregroundColor: Colors.black, // Color del texto del botón
          ),
        ),
      ),

      // Ruta inicial al inicio de la aplicación
      initialRoute: AppRoutes
          .home, // Define la pantalla de inicio utilizando la ruta 'home'

      // Rutas disponibles en la aplicación
      routes:
          AppRoutes.routes, // Se definen las rutas a las que se puede navegar

      // Desactiva la etiqueta de "debug" en el banner superior derecho
      debugShowCheckedModeBanner: false,
    );
  }
}
