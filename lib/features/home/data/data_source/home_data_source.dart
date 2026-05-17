import 'package:luxe/core/api/api_service.dart';
import 'package:luxe/core/api/endpoints.dart';
import 'package:luxe/features/home/data/models/offer_model.dart';
import 'package:luxe/features/home/data/models/product_model.dart';

abstract class HomeDataSource {
  Future<List<ProductModel>> getProducts();
  Future<List<OfferModel>> getOffers();
}

class HomeDataSourceImpl implements HomeDataSource {
  final ApiService apiService;
  HomeDataSourceImpl(this.apiService);

  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await apiService.getRequest(
      endpoint: Endpoints.getProducts,
      queryParams: {
        "searchTerm": "",
        "category": "",
        "minPrice": 0,
        "maxPrice": 10000,
        "isInStock": false,
        "sortBy": "date",
        "sortOrder": "asc",
        "page": 1,
        "pageSize": 20,
      },
    );
    final jsonData = response.data;
    final List<dynamic> productsJson = jsonData['items'] ?? [];
    if (productsJson.isEmpty) {
      return [];
    }
    return productsJson
        .map((productJson) => ProductModel.fromJson(productJson))
        .toList();
  }

  @override
  Future<List<OfferModel>> getOffers() async {
    final response = await apiService.getRequest(
      endpoint: Endpoints.getOffers,
      queryParams: {
        "page": 1,
        "pageSize": 30,
      },
    );
    final jsonData = response.data;
    final List<dynamic> offersJson = jsonData['offers']['items'] ?? [];
    if (offersJson.isEmpty) {
      return [];
    }
    return offersJson
        .map((offerJson) => OfferModel.fromJson(offerJson))
        .where((offer) => offer.image != null && offer.image!.endsWith('crop'))
        .toList();
  }
}
