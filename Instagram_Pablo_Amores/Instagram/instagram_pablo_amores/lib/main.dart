import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Instagram de Pablo",
      home: MiInstagram(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MiInstagram extends StatefulWidget {
  const MiInstagram({super.key});

  @override
  State<MiInstagram> createState() => _MiInstagramState();
}

class _MiInstagramState extends State<MiInstagram> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Row(
          children: [
            Text(
              "alvarezdelvayo",
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              size: 20,
              color: Colors.black,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage:
                      AssetImage('assets/images/img_ProfilePNG.PNG'),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatColumn("1.026", "Publicaciones"),
                      _buildStatColumn("859", "Seguidores"),
                      _buildStatColumn("211", "Seguidos"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Fernando Álvarez del Vayo",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "\"Nunca sabes lo que te depara el futuro\".",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "faqsandroid.com",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                side: BorderSide(
                  color: Colors.grey.shade400,
                  width: 1,
                ),
              ),
              child: const Text(
                "Editar perfil",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildStoryCircle("Nuevo", 'assets/images/story1.jpg'),
                _buildStoryCircle("Pilotando", 'assets/images/story2.jpg'),
                _buildStoryCircle("Prada y Bu...", 'assets/images/story3.jpg'),
                _buildStoryCircle("Arquitectura", 'assets/images/story4.jpg'),
                _buildStoryCircle("Retratos", 'assets/images/story5.jpg'),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(5),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemCount: 9,
              itemBuilder: (context, index) {
                final List<String> publicaciones = [
                  'assets/images/post1.jpg',
                  'assets/images/post2.jpg',
                  'assets/images/post3.jpg',
                  'assets/images/post4.jpg',
                  'assets/images/post5.jpg',
                  'assets/images/post6.jpg',
                  'assets/images/post7.jpg',
                  'assets/images/post8.jpg',
                  'assets/images/post9.jpg',
                ];

                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(publicaciones[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 2,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  Widget _buildStatColumn(String number, String label) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Text(label),
      ],
    );
  }

  Widget _buildStoryCircle(String label, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(imagePath),
            backgroundColor: Colors.grey[300],
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
