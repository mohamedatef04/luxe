import 'package:equatable/equatable.dart';

class OfferModel extends Equatable {
  final String? id;
  final String? name;
  final String? description;
  final String? image;

  @override
  List<Object?> get props => [id, name, description, image];
  const OfferModel({
    this.id,
    this.name,
    this.description,
    this.image,
  });
  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      image: json['coverUrl'] ?? '',
    );
  }

  factory OfferModel.getEmptyProduct() {
    return const OfferModel(
      id: '',
      name: '',
      description: '',
      image: '',
    );
  }
}
