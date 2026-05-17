import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:luxe/core/errors/failures.dart';
import 'package:luxe/features/home/data/data_source/home_data_source.dart';
import 'package:luxe/features/home/data/models/offer_model.dart';
import 'package:luxe/features/home/data/models/product_model.dart';

class HomeRepo {
  final HomeDataSource homeDataSource;
  HomeRepo(this.homeDataSource);

  Future<Either<Failures, List<ProductModel>>> getProducts() async {
    try {
      final products = await homeDataSource.getProducts();
      return right(products);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioExeption(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  Future<Either<Failures, List<OfferModel>>> getOffers() async {
    try {
      final offers = await homeDataSource.getOffers();
      return right(offers);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioExeption(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
