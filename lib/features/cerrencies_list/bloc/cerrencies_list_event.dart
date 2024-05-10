part of 'cerrencies_list_bloc.dart';

abstract class CerrenciesListEvent extends Equatable {}

class LoadCerrenciesList extends CerrenciesListEvent {
  LoadCerrenciesList({this.completer});
  final Completer? completer;

  @override
  List<Object?> get props => [completer];
}
