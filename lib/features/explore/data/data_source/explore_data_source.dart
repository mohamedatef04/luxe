import 'package:luxe/core/api/api_service.dart';
import 'package:luxe/core/api/endpoints.dart';
import 'package:luxe/features/explore/data/models/category_item_model.dart';

abstract class ExploreDataSource {
  Future<List<CategoryItemModel>> getAllCategories();
}

class ExploreDataSourceImpl implements ExploreDataSource {
  final ApiService apiService;
  ExploreDataSourceImpl(this.apiService);
  @override
  Future<List<CategoryItemModel>> getAllCategories() async {
    final response = await apiService.getRequest(
      endpoint: Endpoints.getCategories,
    );
    final jsonData = response.data;
    final List<dynamic> dataList = jsonData['categories'];
    final List<CategoryItemModel> categories = [];
    for (var category in dataList) {
      categories.add(CategoryItemModel.fromJson(category));
    }
    return categories;
  }
}
