import '../../domain/entities/property.dart';

class PropertyModel extends Property {
  PropertyModel({
    required super.id,
    required super.title,
    required super.imageUrl,
    required super.description,
    required super.price,
    required super.location,
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
      id: json['id'],
      title: json['title'],
      imageUrl: json['imageUrl'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      location: json['location'],
    );
  }
}
