import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Планети Сонячної системи',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static final List<Widget> _pages = [
    const StructuralWidgetPage(),
    const StructuralWidgetPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: _appBarSetup(context),
      body: _pages[_selectedIndex],
    );
  }

  AppBar _appBarSetup(BuildContext context) {
    return AppBar(
      title: const Text(
        'Планети Сонячної системи',
        style: TextStyle(fontStyle: FontStyle.italic),
      ),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    );
  }
}

class PlanetCard extends StatelessWidget {
  final String name;
  final String distance;
  final String imageUrl;

  const PlanetCard({
    super.key,
    required this.name,
    required this.distance,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => PlanetDetailPage(name: name, imageUrl: imageUrl),
            ),
          );
        },
        icon: Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.grey[700],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imageUrl,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.amberAccent,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.wb_sunny, color: Colors.amber, size: 16),
                  const SizedBox(width: 5),
                  Text(
                    distance,
                    style: const TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlanetDetailPage extends StatelessWidget {
  final String name;
  final String imageUrl;

  const PlanetDetailPage({
    super.key,
    required this.name,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name), backgroundColor: Colors.deepPurple),
      backgroundColor: Colors.black87,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrl,
                height: 300,
                width: 300,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.amberAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StructuralWidgetPage extends StatelessWidget {
  const StructuralWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          _AssetImage(),
          const SizedBox(height: 10),
          _text(),
          const SizedBox(height: 10),
          _textDescription(),
          const SizedBox(height: 15),
          _textPlanet(),
          const SizedBox(height: 10),
          Column(
            children: [
              _buildRow(
                const PlanetCard(
                  name: "Меркурій",
                  distance: "57,9 млн. км",
                  imageUrl:
                      "https://scx1.b-cdn.net/csz/news/800a/2015/whatsimporta.jpg",
                ),
                const PlanetCard(
                  name: "Венера",
                  distance: "108,2 млн. км",
                  imageUrl:
                      "https://upload.wikimedia.org/wikipedia/commons/8/85/Venus_globe.jpg",
                ),
              ),
              _buildRow(
                const PlanetCard(
                  name: "Земля",
                  distance: "149,6 млн. км",
                  imageUrl:
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/Earth_%2836708117201%29.jpg/800px-Earth_%2836708117201%29.jpg",
                ),
                const PlanetCard(
                  name: "Марс",
                  distance: "227,9 млн. км",
                  imageUrl:
                      "http://kosmos-gid.ru/wp-content/uploads/mars/mars1.jpg",
                ),
              ),
              _buildRow(
                const PlanetCard(
                  name: "Юпітер",
                  distance: "778,3 млн. км",
                  imageUrl:
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Jupiter%2C_image_taken_by_NASA%27s_Hubble_Space_Telescope%2C_June_2019_-_Edited.jpg/300px-Jupiter%2C_image_taken_by_NASA%27s_Hubble_Space_Telescope%2C_June_2019_-_Edited.jpg",
                ),
                const PlanetCard(
                  name: "Сатурн",
                  distance: "1,4 млрд. км",
                  imageUrl:
                      "https://images.wallpaperscraft.ru/image/single/saturn_planeta_koltso_95018_225x300.jpg",
                ),
              ),
              _buildRow(
                const PlanetCard(
                  name: "Уран",
                  distance: "2,9 млрд. км",
                  imageUrl: "https://www.astrohoroscope.info/ru/ur.jpg",
                ),
                const PlanetCard(
                  name: "Нептун",
                  distance: "4,5 млрд. км",
                  imageUrl:
                      "https://cdn.pixabay.com/photo/2020/09/13/17/38/neptune-5568916_640.png",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRow(Widget planet1, Widget planet2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [planet1, planet2],
    );
  }

  static Widget _AssetImage() {
    return Image.network(
      "https://museum-21.su/upload/iblock/a2d/cu5nmj88d9uahq2bdxi3bxx7x6ut5qaa.jpg",
      height: 200,
      width: 300,
    );
  }

  static Widget _text() {
    return const Text(
      "Сонячна система",
      style: TextStyle(color: Colors.amber, fontSize: 24),
    );
  }

  static Widget _textDescription() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        "Сонячна система включає Сонце і планети, що обертаються навколо нього...",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }

  static Widget _textPlanet() {
    return const Text(
      "Планети",
      style: TextStyle(color: Colors.amberAccent, fontSize: 16),
    );
  }
}
