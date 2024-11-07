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
        tiempo = 5;
        puntuacion -= 2;
        cambiarImagen();
      }
    });
  }

  Widget imagenes() {
    return GestureDetector(
      onTap: () {
        cambiarImagen();
        puntuacion++;
        tiempo = 5;
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

  Widget body(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 4),
        marcador(context),
        Expanded(child: juego(context)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Imagenes Aleatorias Game'),
      ),
      drawer: const MyDrawer(),
      body: body(context),
    );
  }
}
