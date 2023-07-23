import 'package:equatable/equatable.dart';

class DestinationModel extends Equatable {
  final String id;
  final String name;
  final String city;
  final String imageUrl;
  final double rating;
  final int price;

  const DestinationModel({
    required this.id,
    required this.name,
    required this.city,
    required this.imageUrl,
    required this.rating,
    this.price = 0,
  });

  factory DestinationModel.fromJson(String id, Map<String, dynamic> json) =>
      DestinationModel(
        id: id,
        name: json['name'],
        city: json['city'],
        imageUrl: json['imageUrl'],
        rating: json['rating'].toDouble(),
        price: json['price'],
      );

  @override
  List<Object?> get props => throw (
        name,
        city,
        imageUrl,
        rating,
        price,
      );
}
