import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_coin/repositories/abstract_cerrencies_lrepository.dart';
import 'package:multi_coin/repositories/models/cerrencies_model.dart';

part 'cerrencies_list_event.dart';
part 'cerrencies_list_state.dart';

class CerrenciesListBloc
    extends Bloc<CerrenciesListEvent, CerrenciesListState> {
  CerrenciesListBloc(this.coinsRepository) : super(CerrenciesListInitial()) {
    on<LoadCerrenciesList>(((event, emit) async {
      try {
        if (state is! CerrenciesListLoaded) {
          emit(CerrenciesListLoading());
        }
        final coinsList = await coinsRepository.getCoinsList();
        emit((CerrenciesListLoaded(coinsList: coinsList)));
      } catch (e) {
        emit(CerrenciesListLoadingFuilure(exception: e));
      } finally {
        event.completer?.complete();
      }
    }));
  }

  final AbstractCerrenciesRepository coinsRepository;
}
