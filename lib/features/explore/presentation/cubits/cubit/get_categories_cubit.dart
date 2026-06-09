import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:luxe/core/utils/safe_emit.dart';
import 'package:luxe/features/explore/data/models/category_item_model.dart';
import 'package:luxe/features/explore/data/repos/explore_repo.dart';

part 'get_categories_state.dart';

class GetCategoriesCubit extends Cubit<GetCategoriesState> {
  GetCategoriesCubit(this.exploreRepo) : super(GetCategoriesInitial());
  final ExploreRepo exploreRepo;

  Future<void> getAllCategories() async {
    safeEmit(GetCategoriesLoading());
    final result = await exploreRepo.getAllCategories();
    result.fold(
      (failure) =>
          safeEmit(GetCategoriesFailure(errorMessage: failure.errorMessage)),
      (categories) => safeEmit(GetCategoriesSuccess(categories: categories)),
    );
  }
}
