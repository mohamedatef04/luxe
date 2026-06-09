import 'package:equatable/equatable.dart';

class CategoryItemModel extends Equatable {
  final String? id;
  final String? name;
  final String? description;
  final String? imageUrl;

  const CategoryItemModel({
    this.id,
    this.name,
    this.description,
    this.imageUrl,
  });

  factory CategoryItemModel.fromJson(Map<String, dynamic> json) {
    return CategoryItemModel(
      id: json['id'] as String? ?? "",
      name: json['name'] as String? ?? "",
      description: json['description'] as String? ?? "",
      imageUrl: json['coverPictureUrl'] as String? ?? "",
    );
  }
  factory CategoryItemModel.getEmptyCategoryItem() => const CategoryItemModel(
    id: "",
    name: "",
    description: "",
    imageUrl: "",
  );

  @override
  List<Object?> get props => [id, name, description, imageUrl];
}
