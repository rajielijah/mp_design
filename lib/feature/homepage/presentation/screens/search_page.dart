import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  bool showFilter = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildMapBackground().animate().fade(duration: 500.ms),
          _buildSearchBar().animate().fade(duration: 700.ms, delay: 200.ms),
          _buildMapControls().animate().fade(duration: 900.ms, delay: 400.ms),
          if (showFilter) _buildFilterMenu().animate().fade(duration: 1100.ms, delay: 600.ms),
          _buildMarkers().animate().fade(duration: 1300.ms, delay: 800.ms),
          _buildListButton().animate().fade(duration: 1500.ms, delay: 1000.ms),
        ],
      ),
    );
  }

  Widget _buildMapBackground() {
    return Container(
      color: Colors.black87,
      width: double.infinity,
      height: double.infinity,
      child: Image.network(
        "https://i.sstatic.net/g1DgT.png",
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildSearchBar() {
    return Positioned(
      top: 50,
      left: 20,
      right: 20,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Saint Petersburg.',
                prefixIcon: const Icon(Icons.search, color: Colors.black54),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Icon(Icons.filter_list, color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _buildMapControls() {
    return Positioned(
      bottom: 100,
      left: 20,
      child: Column(
        children: [
          _buildControlButton(Icons.layers),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () => setState(() => showFilter = !showFilter),
            child: _buildControlButton(Icons.near_me),
          ),
        ],
      ),
    );
  }

  Widget _buildControlButton(IconData icon) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white),
    );
  }

  Widget _buildFilterMenu() {
    return Positioned(
      bottom: 160,
      left: 20,
      child: Container(
        width: 180,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _filterItem(Icons.hotel, "Cosy areas"),
            _filterItem(Icons.monetization_on, "Price", isHighlighted: true),
            _filterItem(Icons.location_city, "Infrastructure"),
            _filterItem(Icons.layers, "Without any layer"),
          ],
        ),
      ),
    );
  }

  Widget _filterItem(IconData icon, String text, {bool isHighlighted = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: isHighlighted ? Colors.orange : Colors.black),
          const SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              color: isHighlighted ? Colors.orange : Colors.black,
              fontWeight: isHighlighted ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMarkers() {
    return const Stack(
      children: [
        Positioned(left: 100, top: 200, child: MarkerWidget()),
        Positioned(left: 200, top: 300, child: MarkerWidget()),
        Positioned(left: 200, top: 400, child: MarkerWidget()),
        Positioned(left: 50, top: 300, child: MarkerWidget()),
        Positioned(left: 300, top: 400, child: MarkerWidget()),
        Positioned(left: 200, top: 200, child: MarkerWidget()),
      ],
    );
  }

  Widget _buildListButton() {
    return Positioned(
      bottom: 100,
      right: 20,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.view_list, color: Colors.white),
            SizedBox(width: 8),
            Text(
              "List of variants",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class MarkerWidget extends StatelessWidget {
  const MarkerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: const Icon(Icons.location_city_rounded, color: Colors.white),
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
