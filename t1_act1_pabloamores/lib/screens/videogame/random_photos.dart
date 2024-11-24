import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t1_act1_pabloamores/screens/screens.dart';

class RandomPhotosScreen extends StatefulWidget {
  const RandomPhotosScreen({super.key});

  @override
  RandomPhotosScreenState createState() => RandomPhotosScreenState();
}

class RandomPhotosScreenState extends State<RandomPhotosScreen> {
  int puntuacion = 0;
  int tiempo = 5;
  late Timer timer;
  String imagenSeleccionada = 'assets/images/insecto1.jpg';
  double posX = 100;
  double posY = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Imagenes Aleatorias Game'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => mostrarSimpleDialog(context),
          ),
        ],
      ),
      drawer: const MyDrawer(),
      // Detecta cuando el drawer se abre o cierra
      onDrawerChanged: (isOpen) {
        if (isOpen) {
          // Pausa el cronómetro al abrir el drawer
          timer.cancel();
        } else {
          // Reanuda el cronómetro al cerrar el drawer
          cronometro();
        }
      },
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
    return Column(
      children: [
        marcador(context),
        Expanded(child: juego(context)),
      ],
    );
  }

  Widget marcador(BuildContext context) {
    return Container(
      color: const Color(0xFF00ADB5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "PUNTUACIÓN",
                        style: GoogleFonts.abel(fontSize: 25),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$puntuacion',
                        style: const TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                width: 100,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "TIEMPO",
                        style: GoogleFonts.abel(fontSize: 25),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$tiempo',
                        style: const TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget juego(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 5, 45, 47),
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Positioned(
            left: posX,
            top: posY,
            child: imagenes(),
          ),
        ],
      ),
    );
  }

  Widget imagenes() {
    return GestureDetector(
      onTap: () {
        cambiarImagen();
        setState(() {
          puntuacion++;
          tiempo = 5;
        });
        if (puntuacion % 5 == 0) {
          mostrarSnackBar(
              context, 'Tienes $puntuacion puntos, ¡¡Aplastalos a todoos!!');
        }
      },
      child: SizedBox(
        width: 75,
        height: 75,
        child: ClipRRect(
          child: Image.asset(
            imagenSeleccionada,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  void cambiarImagen() {
    final List<String> imagenes = [
      'assets/images/insecto1.jpg',
      'assets/images/insecto2.jpg',
      'assets/images/insecto3.jpg',
    ];
    final random = Random();

    setState(() {
      imagenSeleccionada = imagenes[random.nextInt(imagenes.length)];
      posX = random.nextDouble() * (MediaQuery.of(context).size.width - 75);
      posY = random.nextDouble() * (MediaQuery.of(context).size.height - 300);
    });
  }

  @override
  void initState() {
    super.initState();
    cronometro();
  }

  void cronometro() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (tiempo > 0) {
        setState(() {
          tiempo--;
        });
      }
      if (tiempo == 0) {
        setState(() {
          tiempo = 5;
          puntuacion -= 2;
          cambiarImagen();
        });
        mostrarAlertDialog(
            context, 'Tiempo agotado', 'Has perdido 2 puntos. ¡Sigue jugando!');
      }
    });
  }

  void mostrarAlertDialog(BuildContext context, String titulo, String mensaje) {
    timer.cancel();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(titulo),
        content: Text(mensaje),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    ).then((_) {
      // Reanudar el cronómetro cuando se cierra el diálogo
      cronometro();
    });
  }

  void mostrarSnackBar(BuildContext context, String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensaje),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void mostrarSimpleDialog(BuildContext context) {
    // Cancelar el Timer para pausar el cronómetro
    timer.cancel();

    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('Instrucciones'),
        children: [
          SimpleDialogOption(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Haz clic en las imágenes para ganar puntos.'),
          ),
          SimpleDialogOption(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Evita que el tiempo se agote.'),
          ),
        ],
      ),
    ).then((_) {
      // Reanudar el cronómetro cuando se cierra el diálogo
      cronometro();
    });
  }
}
