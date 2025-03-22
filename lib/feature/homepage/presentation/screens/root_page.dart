import 'package:flutter/material.dart';
import 'home_page.dart';
import 'main_page.dart';
import 'search_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const MainPage(),
    const SearchPage(),
    const ComingSoonPage(title: "Messages"),
    const ComingSoonPage(title: "Favorites"),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _pages[_selectedIndex],
          Positioned(
            bottom: 24,
            left: MediaQuery.of(context).size.width * 0.15, 
            right: MediaQuery.of(context).size.width * 0.15,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    spreadRadius: 2,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNavItem(Icons.home_outlined, Icons.home, 0),
                  _buildNavItem(Icons.search_outlined, Icons.search, 1),
                  _buildNavItem(Icons.message_outlined, Icons.message, 2),
                  _buildNavItem(Icons.favorite_border, Icons.favorite, 3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, IconData selectedIcon, int index) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.orange : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          isSelected ? selectedIcon : icon,
          color: isSelected ? Colors.white : Colors.grey.shade400,
          size: 18,
        ),
      ),
    );
  }
}
