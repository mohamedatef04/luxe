import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:luxe/core/errors/failures.dart';
import 'package:luxe/features/explore/data/data_source/explore_data_source.dart';
import 'package:luxe/features/explore/data/models/category_item_model.dart';

class ExploreRepo {
  final ExploreDataSource exploreDataSource;
  ExploreRepo(this.exploreDataSource);
  Future<Either<Failures, List<CategoryItemModel>>> getAllCategories() async {
    try {
      final categories = await exploreDataSource.getAllCategories();
      return Right(categories);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioExeption(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
