import 'package:flutter/material.dart';
import '../../domain/entities/property.dart';

class PropertyDetailPage extends StatelessWidget {
  final Property property;
  const PropertyDetailPage({Key? key, required this.property}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(property.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero animation for a smooth image transition.
            Hero(
              tag: 'property_${property.id}',
              child: Image.network(
                property.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 250,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                property.title,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                property.location,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '\$${property.price}',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: Colors.green),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(property.description),
            ),
          ],
        ),
      ),
    );
  }
}
