part of 'get_offers_cubit.dart';

sealed class GetOffersState extends Equatable {
  const GetOffersState();

  @override
  List<Object> get props => [];
}

final class GetOffersInitial extends GetOffersState {}

final class GetOffersLoading extends GetOffersState {}

final class GetOffersLoaded extends GetOffersState {
  final List<OfferModel> offers;
  const GetOffersLoaded(this.offers);
  @override
  List<Object> get props => [offers];
}

final class GetOffersError extends GetOffersState {
  final String errorMessage;
  const GetOffersError(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
