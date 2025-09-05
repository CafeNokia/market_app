import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      home: TransparentAppBarPage(),
    );
  }
}

class TransparentAppBarPage extends StatefulWidget {
  @override
  _TransparentAppBarPageState createState() => _TransparentAppBarPageState();
}

class _TransparentAppBarPageState extends State<TransparentAppBarPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Center(child: Text("Home Page", style: TextStyle(fontSize: 24, color: Colors.white))),
    Center(child: Text("Indexs Page", style: TextStyle(fontSize: 24, color: Colors.white))),
    Center(child: Text("List Page", style: TextStyle(fontSize: 24, color: Colors.white))),
    Center(child: Text("Profile Page", style: TextStyle(fontSize: 24, color: Colors.white))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("MOS"),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            // colors: [const Color.fromARGB(255, 7, 51, 87), const Color.fromARGB(255, 8, 8, 8)],
            colors: [const Color.fromARGB(255, 6, 12, 17), const Color.fromARGB(255, 8, 8, 8)],
          ),
        ),
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black.withOpacity(0.8), // semi-transparent bar
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Indexs"),
          BottomNavigationBarItem(icon: Icon(Icons.add_location), label: "List"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}