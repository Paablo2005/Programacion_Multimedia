import 'package:t1_act1_pabloamores/screens/screens.dart';

class ColumnPhotosScreen extends StatelessWidget {
  const ColumnPhotosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fotos en Columna'),
      ),
      drawer: const MyDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/image1.jpg', width: 100, height: 100),
          const SizedBox(height: 10),
          Image.asset('assets/images/image2.jpg', width: 100, height: 100),
          const SizedBox(height: 10),
          Image.asset('assets/images/image3.jpg', width: 100, height: 100),
        ],
      ),
    );
  }
}
