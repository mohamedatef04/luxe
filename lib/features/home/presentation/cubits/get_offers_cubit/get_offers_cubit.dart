import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:luxe/core/utils/safe_emit.dart';
import 'package:luxe/features/home/data/models/offer_model.dart';
import 'package:luxe/features/home/data/repos/home_repo.dart';

part 'get_offers_state.dart';

class GetOffersCubit extends Cubit<GetOffersState> {
  GetOffersCubit(this.homeRepo) : super(GetOffersInitial());
  final HomeRepo homeRepo;

  Future<void> getOffers() async {
    safeEmit(GetOffersLoading());
    final result = await homeRepo.getOffers();
    result.fold(
      (failure) {
        safeEmit(GetOffersError(failure.errorMessage));
      },
      (offers) {
        safeEmit(GetOffersLoaded(offers));
      },
    );
  }
}
