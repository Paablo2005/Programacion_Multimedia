import 'dart:math';
import 'package:flutter/material.dart';
import 'package:t1_act1_pabloamores/screens/screens.dart';

class SieteYMediaScreen extends StatefulWidget {
  const SieteYMediaScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SieteYMediaScreenState createState() => _SieteYMediaScreenState();
}

class _SieteYMediaScreenState extends State<SieteYMediaScreen> {
  // Lista de cartas disponibles en el juego
  final List<String> cartas = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    'Sota',
    'Caballo',
    'Rey'
  ];

  // Mapa que asocia las cartas con sus valores en puntos
  final Map<String, double> valoresCartas = {
    '1': 1.0,
    '2': 2.0,
    '3': 3.0,
    '4': 4.0,
    '5': 5.0,
    '6': 6.0,
    '7': 7.0,
    'Sota': 0.5,
    'Caballo': 0.5,
    'Rey': 0.5,
  };

  // Variables que guardan el estado de las puntuaciones del jugador y el rival
  double puntuacionJugador = 0.0;
  double puntuacionRival = 0.0;
  List<String> cartasJugador = [];
  List<String> cartasRival = [];
  int rondasJugadorGanadas = 0;
  int rondasRivalGanadas = 0;
  int rondasPorGanar = 5; // El número de rondas necesarias para ganar el juego
  bool sePlanto = false; // Controla si el jugador se ha plantado

  // Método para que el jugador saque una carta
  void sacarCartaJugador() {
    if (sePlanto) {
      return; // No permitir sacar cartas si el jugador se ha plantado
    }
    final carta = cartas[Random().nextInt(cartas.length)];
    setState(() {
      cartasJugador.add(carta);
      puntuacionJugador += valoresCartas[carta]!;
      // Si el jugador se pasa de 7.5 puntos, pierde la ronda
      if (puntuacionJugador > 7.5) {
        rondasRivalGanadas++;
        mostrarResultado('¡Te pasaste! Pierdes esta ronda.');
      } else if (puntuacionJugador == 7.5) {
        rondasJugadorGanadas++;
        jugarRival(); // El jugador gana automáticamente si llega a 7.5 puntos
      }
    });
  }

  // Método que simula el turno del rival
  Future<void> jugarRival() async {
    while (puntuacionRival < 6.5) {
      // El rival sigue sacando cartas hasta alcanzar 6.5 puntos
      await Future.delayed(
          const Duration(seconds: 1)); // Pausa para hacer el juego más dinámico
      final carta = cartas[Random().nextInt(cartas.length)];
      setState(() {
        cartasRival.add(carta);
        puntuacionRival += valoresCartas[carta]!;
      });
      if (puntuacionRival > 7.5) break; // Si el rival se pasa, termina su turno
    }
    determinarGanador(); // Determina el ganador de la ronda
  }

  // Método que compara las puntuaciones para determinar quién ganó la ronda
  void determinarGanador() {
    if (puntuacionRival > 7.5) {
      rondasJugadorGanadas++;
      mostrarResultado('¡El rival se pasó! Ganaste esta ronda.');
    } else if (puntuacionJugador > puntuacionRival) {
      rondasJugadorGanadas++;
      mostrarResultado(
          '¡Ganaste esta ronda! Tu puntuación: ${puntuacionJugador.toStringAsFixed(1)}.');
    } else if (puntuacionJugador == puntuacionRival) {
      mostrarResultado(
          'Empate esta ronda. Ambos tienen ${puntuacionJugador.toStringAsFixed(1)} puntos.');
    } else {
      rondasRivalGanadas++;
      mostrarResultado('Perdiste esta ronda. El rival ganó.');
    }
  }

  // Muestra un mensaje con el resultado de la ronda
  void mostrarResultado(String mensaje) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Fin de la ronda',
              style: TextStyle(fontWeight: FontWeight.bold)),
          content: Text(mensaje, style: const TextStyle(color: Colors.black54)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                verificarGanador(); // Comprueba si alguien ha ganado el juego
                reiniciarRonda(); // Reinicia la ronda para jugar de nuevo
              },
              child: const Text('Jugar de nuevo',
                  style: TextStyle(color: Colors.blue)),
            ),
          ],
        );
      },
    );
  }

  // Verifica si alguien ha ganado el juego
  void verificarGanador() {
    if (rondasJugadorGanadas >= rondasPorGanar) {
      mostrarResultadoFinal('¡Ganaste el juego!');
    } else if (rondasRivalGanadas >= rondasPorGanar) {
      mostrarResultadoFinal('¡El rival ganó el juego!');
    }
  }

  // Muestra el resultado final cuando uno de los jugadores gana el juego
  void mostrarResultadoFinal(String mensaje) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Fin del juego',
              style: TextStyle(fontWeight: FontWeight.bold)),
          content: Text(mensaje, style: const TextStyle(color: Colors.black54)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                reiniciarJuego(); // Reinicia el juego para empezar de nuevo
              },
              child: const Text('Reiniciar juego',
                  style: TextStyle(color: Colors.blue)),
            ),
          ],
        );
      },
    );
  }

  // Reinicia las rondas del juego
  void reiniciarJuego() {
    setState(() {
      rondasJugadorGanadas = 0;
      rondasRivalGanadas = 0;
    });
  }

  // Reinicia la ronda actual
  void reiniciarRonda() {
    setState(() {
      puntuacionJugador = 0.0;
      puntuacionRival = 0.0;
      cartasJugador.clear();
      cartasRival.clear();
      sePlanto = false;
    });
  }

  // Método para que el jugador se plante
  void plantarse() {
    setState(() {
      sePlanto = true;
    });
    jugarRival(); // El jugador se planta y el rival sigue jugando
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Las siete y media',
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepPurple,
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Tu puntuación: ${puntuacionJugador.toStringAsFixed(1)}',
                style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple),
              ),
              const SizedBox(height: 15),
              Wrap(
                spacing: 10,
                children: cartasJugador
                    .map((carta) => Chip(
                          backgroundColor: Colors.deepPurple[100],
                          label:
                              Text(carta, style: const TextStyle(fontSize: 18)),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: sePlanto
                    ? null
                    : sacarCartaJugador, // Solo se puede sacar carta si no te has plantado
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple),
                child:
                    const Text('Sacar carta', style: TextStyle(fontSize: 18)),
              ),
              ElevatedButton(
                onPressed: sePlanto
                    ? null
                    : plantarse, // Solo se puede plantarse si no te has plantado ya
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                child: const Text('Plantarse', style: TextStyle(fontSize: 18)),
              ),
              const SizedBox(height: 20),
              if (puntuacionJugador <= 7.5)
                Text(
                  'Puntuación del rival: ${puntuacionRival.toStringAsFixed(1)}',
                  style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple),
                ),
              Wrap(
                spacing: 10,
                children: cartasRival
                    .map((carta) => Chip(
                          backgroundColor: Colors.grey[300],
                          label:
                              Text(carta, style: const TextStyle(fontSize: 18)),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 20),
              Text(
                'Rondas ganadas - Jugador: $rondasJugadorGanadas | Rival: $rondasRivalGanadas',
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
