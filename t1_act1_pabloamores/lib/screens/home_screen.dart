import 'package:t1_act1_pabloamores/screens/screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer Navigation App'),
      ),
      drawer: const MyDrawer(),
      body: const Center(child: Text('Selecciona una opción en el Drawer')),
    );
  }
}
