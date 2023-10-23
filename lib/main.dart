import 'package:first_app/pages/feed_page.dart';
import 'package:first_app/pages/my_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page Course'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final _pageWidgets = [
    FeedPage(),
    MyPage(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: _pageWidgets.elementAt(_currentIndex),
      ElevatedButton(
        onPressed: _onButtonTapped,
        child: const Text('次のページへ'),
      ),
      //   bottomNavigationBar: BottomNavigationBar(
      //     items: const <BottomNavigationBarItem>[
      //       BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //       BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      //     ],
      //     currentIndex: _currentIndex,
      //     onTap: _onItemTapped,
      // ),
  
    );
  }

void _onButtonTapped() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _pageWidgets.length; // ページを切り替えます
    });
  }
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _currentIndex = index;
  //   });
  // }
}
