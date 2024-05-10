part of 'cerrencies_list_bloc.dart';

abstract class CerrenciesListState extends Equatable {}

class CerrenciesListInitial extends CerrenciesListState {
  @override
  List<Object?> get props => [];
}

class CerrenciesListLoading extends CerrenciesListState {
  @override
  List<Object?> get props => [];
}

class CerrenciesListLoaded extends CerrenciesListState {
  CerrenciesListLoaded({required this.coinsList});
  final List<CurrencyCoin> coinsList;

  @override
  List<Object?> get props => [coinsList];
}

class CerrenciesListLoadingFuilure extends CerrenciesListState {
  CerrenciesListLoadingFuilure({this.exception});
  final Object? exception;

  @override
  List<Object?> get props => [exception];
}
