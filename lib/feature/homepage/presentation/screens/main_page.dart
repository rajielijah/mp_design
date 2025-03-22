import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<bool> _isVisible = [];

  @override
  void initState() {
    super.initState();
    _isVisible = List.generate(5, (index) => false);
    _startAnimations();
  }

  void _startAnimations() {
    for (int i = 0; i < _isVisible.length; i++) {
      Future.delayed(Duration(seconds: i), () {
        if (mounted) {
          setState(() {
            _isVisible[i] = true;
          });
        }
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFFFFFF), Color(0xFFF9D49A)],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildAnimatedWidget(0, _buildHeader(context)),
              _buildAnimatedWidget(1, _buildPropertySection()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedWidget(int index, Widget child) {
    return AnimatedOpacity(
      opacity: _isVisible[index] ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 500),
      child: AnimatedSlide(
        offset: _isVisible[index] ? Offset.zero : const Offset(0, 0.2),
        duration: const Duration(milliseconds: 500),
        child: child,
      ),
    );
  }


  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _buildLocationTag(),
              const Spacer(),
              const CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                  "https://img.freepik.com/free-photo/happiness-wellbeing-confidence-concept-cheerful-attractive-african-american-woman-curly-haircut-cross-arms-chest-self-assured-powerful-pose-smiling-determined-wear-yellow-sweater_176420-35063.jpg?semt=ais_hybrid",
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Text(
            'Hi, Marina',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: const Color(0xFFA5957E),
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            "Let's select your\nperfect place",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: const Color(0xFF232220),
                  fontSize: 34,
                ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatCard("BUY", "1 034", "Active", Colors.amber, Colors.white),
              _buildStatCard("RENT", "2 212", "Offers", Colors.white, const Color(0xFFA5957E)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLocationTag() {
    return Container(
      height: 45,
      width: 140,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Row(
        children: [
          Icon(Icons.location_on, color: Color(0xFFA5957E)),
          Text("Saint Petersburg", style: TextStyle(color: Color(0xFFA5957E))),
        ],
      ),
    );
  }

  Widget _buildStatCard(String header, String value, String label, Color bgColor, Color textColor) {
    return Container(
      height: 150,
      width: 140,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        shape: bgColor == Colors.amber ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: bgColor == Colors.white ? BorderRadius.circular(16) : null,
      ),
      child: _StatItem(header: header, value: value, label: label, color: textColor),
    );
  }

  Widget _buildPropertySection() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Column(
        children: [
          _buildPropertyCard("Trofimova St, 43", "https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?q=80&w=2880&auto=format"),
          Row(
            children: [
              _buildPropertyCard1("Trofimova St, 43", "https://images.unsplash.com/photo-1580216643062-cf460548a66a?q=80&w=1867&auto=format"),
              _buildPropertyCard1("Trofimova St, 43", "https://images.unsplash.com/photo-1605886290933-7ed7b3240d4a?q=80&w=3174&auto=format"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPropertyCard(String address, String imagePath) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              Image.network(
                imagePath,
                width: double.infinity,
                height: 180,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: Container(
                  height: 50,
                  width: 310,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFA5957E),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Spacer(),
                      Text(
                        address,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: 70,
                        width: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white
                        ),
                        child: const Center(
                          child: Icon(Icons.arrow_forward_ios, size: 10, ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPropertyCard1(String address, String imagePath) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              Image.network(
                imagePath,
                width: 163,
                height: 180,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: Container(
                  height: 50,
                  width: 150,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFA5957E),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Text(
                        address,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: 70,
                        width: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white
                        ),
                        child: const Center(
                          child: Icon(Icons.arrow_forward_ios, size: 10, ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String header;
  final String value;
  final String label;
  final Color color;

  const _StatItem({super.key, required this.header, required this.value, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(header, style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: color, fontSize: 12)),
        const SizedBox(height: 30),
        Text(value, style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: color, fontWeight: FontWeight.bold)),
        Text(label, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: color)),
      ],
    );
  }
}
