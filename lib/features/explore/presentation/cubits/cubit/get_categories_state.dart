part of 'get_categories_cubit.dart';

sealed class GetCategoriesState extends Equatable {
  const GetCategoriesState();

  @override
  List<Object> get props => [];
}

final class GetCategoriesInitial extends GetCategoriesState {}

class GetCategoriesLoading extends GetCategoriesState {}

class GetCategoriesFailure extends GetCategoriesState {
  final String errorMessage;
  const GetCategoriesFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class GetCategoriesSuccess extends GetCategoriesState {
  final List<CategoryItemModel> categories;
  const GetCategoriesSuccess({required this.categories});

  @override
  List<Object> get props => [categories];
}
