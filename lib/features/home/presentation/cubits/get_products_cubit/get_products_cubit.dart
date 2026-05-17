import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:luxe/core/utils/safe_emit.dart';
import 'package:luxe/features/home/data/models/product_model.dart';
import 'package:luxe/features/home/data/repos/home_repo.dart';

part 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  GetProductsCubit(this.homeRepo) : super(GetProductsInitial());
  final HomeRepo homeRepo;

  Future<void> getProducts() async {
    safeEmit(GetProductsLoading());
    final result = await homeRepo.getProducts();
    result.fold(
      (failures) {
        safeEmit(GetProductsFailure(failures.errorMessage));
      },
      (products) {
        safeEmit(GetProductsSuccess(products));
      },
    );
  }
}
