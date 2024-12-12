import 'package:flutter/material.dart';
// Importación de las pantallas necesarias desde 'screens.dart'
import 'package:t1_act1_pabloamores/screens/screens.dart';

// Definición de un widget Stateful llamado MiContador
class MiContador extends StatefulWidget {
  const MiContador({super.key});

  @override
  // Creación del estado asociado al widget MiContador
  // Se ignora la advertencia relacionada con el uso del prefijo de tipo privado para la clase de estado
  // Esto es una convención para mantener el código organizado
  // ignore: library_private_types_in_public_api
  _MiContadorState createState() => _MiContadorState();
}

// Clase que maneja el estado de MiContador
class _MiContadorState extends State<MiContador> {
  // Variable privada que guarda el valor del contador
  int _contador = 0;

  // Método que incrementa el valor del contador
  void _incrementar() {
    setState(() {
      _contador++; // Aumenta el contador en 1 y actualiza la UI
    });
  }

  // Método que decrementa el valor del contador
  void _decrementar() {
    setState(() {
      if (_contador > 0) _contador--; // Evita que el contador sea negativo
    });
  }

  // Método que resetea el contador a 0
  void _resetear() {
    setState(() {
      _contador = 0; // Restablece el contador a 0
    });
  }

  @override
  Widget build(BuildContext context) {
    // Método que construye la UI del widget
    return Scaffold(
      // AppBar para mostrar un encabezado en la parte superior
      appBar: AppBar(
        title: const Text('Contador de Clics'),
      ),
      // Drawer con el menú de navegación
      drawer: const MyDrawer(),
      body: Center(
        // Cuerpo de la pantalla, centrado en la pantalla
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Centra los elementos verticalmente
          children: <Widget>[
            const Text(
              'Has pulsado el botón este número de veces:',
            ),
            // Muestra el valor del contador
            Text(
              '$_contador', // Muestra el valor del contador actualizado
              style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold), // Estilo del número
            ),
            const SizedBox(height: 30), // Espacio vertical entre los elementos
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Centra los botones en horizontal
              children: [
                // Botón para incrementar el contador
                ElevatedButton(
                  onPressed:
                      _incrementar, // Asocia la acción de incrementar al botón
                  child: const Text('Incrementar'),
                ),
                const SizedBox(width: 10), // Espacio entre botones
                // Botón para decrementar el contador
                ElevatedButton(
                  onPressed:
                      _decrementar, // Asocia la acción de decrementar al botón
                  child: const Text('Decrementar'),
                ),
                const SizedBox(width: 10), // Espacio entre botones
                // Botón para resetear el contador
                ElevatedButton(
                  onPressed: _resetear, // Asocia la acción de resetear al botón
                  child: const Text('Reiniciar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
