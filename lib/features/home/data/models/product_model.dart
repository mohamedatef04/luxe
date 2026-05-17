import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final String? id;
  final String? productCode;
  final String? sellerId;
  final String? arabicName;
  final String? englishName;
  final String? arabicDescription;
  final String? englishDescription;
  final String? coverPictureUrl;
  final String? color;
  final double? price;
  final int? stock;
  final double? weight;
  final String? category;
  final num? rating;
  final int? reviewsCount;
  final num? discountPercentage;
  final List<String>? categories;

  const ProductModel({
    this.id,
    this.productCode,
    this.sellerId,
    this.arabicName,
    this.englishName,
    this.arabicDescription,
    this.englishDescription,
    this.coverPictureUrl,
    this.color,
    this.price,
    this.stock,
    this.weight,
    this.discountPercentage,
    this.category,
    this.rating,
    this.reviewsCount,
    this.categories,
  });
  @override
  List<Object?> get props => [
    id,
    productCode,
    sellerId,
    arabicName,
    englishName,
    arabicDescription,
    englishDescription,
    coverPictureUrl,
    color,
    price,
    stock,
    weight,
    discountPercentage,
    category,
    rating,
    reviewsCount,
    ...?categories,
  ];

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"] ?? "",
    productCode: json["productCode"] ?? "",
    sellerId: json["sellerId"] ?? "",
    arabicName: json["arabicName"] ?? "",
    englishName: json["name"] ?? "",
    arabicDescription: json["arabicDescription"] ?? "",
    englishDescription: json["description"] ?? "",
    coverPictureUrl: json["coverPictureUrl"] ?? "",
    color: json["color"] ?? "",
    price: json["price"] ?? 0.0,
    stock: json["stock"] ?? 0,
    weight: json["weight"] ?? 0.0,
    discountPercentage: json["discountPercentage"] ?? 0.0,
    category: json["category"] ?? "",
    rating: json["rating"] ?? 0.0,
    reviewsCount: json["reviewsCount"] ?? 0,
    categories: json["categories"] == null
        ? []
        : List<String>.from(json["categories"]!.map((x) => x)),
  );

  factory ProductModel.getEmptyProduct() => const ProductModel(
    id: "",
    productCode: "",
    sellerId: "",
    arabicName: "",
    englishName: "",
    arabicDescription: "",
    englishDescription: "",
    coverPictureUrl: "",
    color: "",
    price: 0.0,
    stock: 0,
    weight: 0.0,
    discountPercentage: 0.0,
    category: "",
    rating: 0.0,
    reviewsCount: 0,
    categories: [],
  );
}
