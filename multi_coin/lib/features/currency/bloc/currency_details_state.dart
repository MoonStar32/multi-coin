// part of 'currency_details_bloc.dart';

// abstract class CerrenciesDetailsState extends Equatable {}

// class CerrenciesDetailsInitial extends CerrenciesDetailsState {
//   @override
//   List<Object?> get props => [];
// }

// class CerrenciesDetailsLoading extends CerrenciesDetailsState {
//   @override
//   List<Object?> get props => [];
// }

// class CerrenciesDetailsLoaded extends CerrenciesDetailsState {
//   CerrenciesDetailsLoaded({required this.coinsList});
//   final List<CurrencyCoin> coinsList;

//   @override
//   List<Object?> get props => [coinsList];
// }

// class CerrenciesDetailsLoadingFuilure extends CerrenciesDetailsState {
//   CerrenciesDetailsLoadingFuilure({this.exception});
//   final Object? exception;

//   @override
//   List<Object?> get props => [exception];
// }

part of 'currency_details_bloc.dart';

class CurrencyCoinDetailsState extends Equatable {
  const CurrencyCoinDetailsState();

  @override
  List<Object?> get props => [];
}

class CurrencyCoinDetailsLoading extends CurrencyCoinDetailsState {
  const CurrencyCoinDetailsLoading();
}

class CurrencyCoinDetailsLoaded extends CurrencyCoinDetailsState {
  const CurrencyCoinDetailsLoaded(this.coinDetails);

  final CurrencyCoin coinDetails;

  @override
  List<Object?> get props => [coinDetails];
}

class CurrencyCoinDetailsLoadingFailure extends CurrencyCoinDetailsState {
  const CurrencyCoinDetailsLoadingFailure(this.exception);

  final Object exception;

  @override
  List<Object?> get props => super.props..add(exception);
}
