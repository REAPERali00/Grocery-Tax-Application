import 'package:flutter/material.dart';
import 'package:practice/pages/grocery_page.dart';
import 'package:practice/pages/homepage.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0; // Current index of the selected item in the bar
  // Define the different screens
  final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const Grocery(),
    // Add more screens here
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            label: 'Costs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Shopping List',
          ),

          // Add more items here
        ],
        backgroundColor: _selectedIndex % 2 == 0 ? Colors.green : Colors.purple,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.limeAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}
