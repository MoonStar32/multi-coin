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
