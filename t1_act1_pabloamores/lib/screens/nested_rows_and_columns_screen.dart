import 'package:t1_act1_pabloamores/screens/screens.dart';

class NestedRowsAndColumnsScreen extends StatelessWidget {
  const NestedRowsAndColumnsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejemplo de filas y columnas anidadas'),
      ),
      drawer: const MyDrawer(),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Icon(Icons.phone, size: 50),
                  SizedBox(height: 10),
                  Text('Llamar por teléfono'),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Icon(Icons.phone, size: 50),
                  SizedBox(height: 10),
                  Text('Llamar por teléfono'),
                ],
              ),
              SizedBox(width: 20),
              Column(
                children: [
                  Icon(Icons.phone, size: 50),
                  SizedBox(height: 10),
                  Text('Llamar por teléfono'),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Icon(Icons.phone, size: 50),
                  SizedBox(height: 10),
                  Text('Llamar por teléfono'),
                ],
              ),
              SizedBox(width: 20),
              Column(
                children: [
                  Icon(Icons.phone, size: 50),
                  SizedBox(height: 10),
                  Text('Llamar por teléfono'),
                ],
              ),
              SizedBox(width: 20),
              Column(
                children: [
                  Icon(Icons.phone, size: 50),
                  SizedBox(height: 10),
                  Text('Llamar por teléfono'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
