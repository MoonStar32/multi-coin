// part of 'currency_details_bloc.dart';

// abstract class CerrenciesListEvent extends Equatable {}

// class LoadCerrenciesDetails extends CerrenciesListEvent {
//   LoadCerrenciesDetails({this.completer});
//   final Completer? completer;

//   @override
//   List<Object?> get props => [completer];
// }

part of 'currency_details_bloc.dart';

abstract class CurrencyCoinDetailsEvent extends Equatable {
  const CurrencyCoinDetailsEvent();

  @override
  List<Object> get props => [];
}

class LoadCurrencyCoinDetails extends CurrencyCoinDetailsEvent {
  const LoadCurrencyCoinDetails({
    required this.currencyCode,
  });

  final String currencyCode;

  @override
  List<Object> get props => super.props..add(currencyCode);
}
