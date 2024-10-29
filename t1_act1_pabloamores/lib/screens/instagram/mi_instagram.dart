import 'package:flutter/material.dart';
import 'package:t1_act1_pabloamores/screens/instagram/widgets/stat_column.dart';
import 'package:t1_act1_pabloamores/screens/instagram/widgets/story_circle.dart';

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
      appBar: _buildAppBar(),
      body: _buildBody(context),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
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
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/images/img_ProfilePNG.PNG'),
              ),
              SizedBox(width: 30),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    StatColumn("1.026", "Publicaciones"),
                    StatColumn("859", "Seguidores"),
                    StatColumn("211", "Seguidos"),
                  ],
                ),
              ),
            ],
          ),
        ),
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
            SizedBox(height: 2),
            Text(
              "\"Nunca sabes lo que te depara el futuro\".",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 2),
            Text(
              "faqsandroid.com",
              style: TextStyle(
                fontSize: 14,
                color: Colors.blue,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        _buildEditButton(context),
        const SizedBox(height: 4),
        _buildStories(),
        const SizedBox(height: 4),
        _buildIconRow(),
        const SizedBox(height: 4),
        _buildGrid(),
      ],
    );
  }

  Widget _buildEditButton(BuildContext context) {
    return SizedBox(
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
    );
  }

  Widget _buildStories() {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          StoryCircle("Nuevo", 'assets/images/story1.jpg'),
          StoryCircle("Pilotando", 'assets/images/story2.jpg'),
          StoryCircle("Prada y Bu...", 'assets/images/story3.jpg'),
          StoryCircle("Arquitectura", 'assets/images/story4.jpg'),
          StoryCircle("Retratos", 'assets/images/story5.jpg'),
        ],
      ),
    );
  }

  Widget _buildIconRow() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.photo, size: 30),
        SizedBox(width: 150),
        Icon(Icons.video_library, size: 30),
      ],
    );
  }

  Widget _buildGrid() {
    return Expanded(
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
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
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
    );
  }
}
