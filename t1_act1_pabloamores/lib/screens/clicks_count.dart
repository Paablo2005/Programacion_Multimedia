import 'package:t1_act1_pabloamores/screens/screens.dart';

class MiContador extends StatefulWidget {
  const MiContador({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MiContadorState createState() => _MiContadorState();
}

class _MiContadorState extends State<MiContador> {
  int _contador = 0;

  void _incrementar() {
    setState(() {
      _contador++;
    });
  }

  void _decrementar() {
    setState(() {
      if (_contador > 0) _contador--; // Evitamos valores negativos
    });
  }

  void _resetear() {
    setState(() {
      _contador = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador de Clics'),
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Has pulsado el botón este número de veces:',
            ),
            Text(
              '$_contador',
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _incrementar,
                  child: const Text('Incrementar'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _decrementar,
                  child: const Text('Decrementar'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _resetear,
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
