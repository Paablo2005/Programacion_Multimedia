import 'package:t1_act1_pabloamores/screens/screens.dart';

class NameScreen extends StatelessWidget {
  const NameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nombre y Repositorio'),
      ),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pablo Amores Muñoz',
              style: GoogleFonts.abel(fontSize: 34),
            ),
            const SizedBox(height: 10),
            const Text(
              'https://github.com/tuRepositorio',
              style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
