// import 'dart:async';

// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:multi_coin/repositories/abstract_cerrencies_lrepository.dart';
// import 'package:multi_coin/repositories/models/cerrencies_model.dart';

// part 'currency_details_event.dart';
// part 'currency_details_state.dart';

// class CerrenciesDetailsBloc
//     extends Bloc<CerrenciesListEvent, CerrenciesDetailsState> {
//   CerrenciesDetailsBloc(this.coinsRepository)
//       : super(CerrenciesDetailsInitial()) {
//     on<LoadCerrenciesDetails>(((event, emit) async {
//       try {
//         if (state is! CerrenciesDetailsLoaded) {
//           emit(CerrenciesDetailsLoading());
//         }
//         final coinsList = await coinsRepository.getCoinsList();
//         emit((CerrenciesDetailsLoaded(coinsList: coinsList)));
//       } catch (e) {
//         emit(CerrenciesDetailsLoadingFuilure(exception: e));
//       } finally {
//         event.completer?.complete();
//       }
//     }));
//   }

//   final AbstractCerrenciesRepository coinsRepository;
// }

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:multi_coin/repositories/cerrencies.dart';
import 'package:multi_coin/repositories/cerrencies_repository.dart';

part 'currency_details_event.dart';
part 'currency_details_state.dart';

class CurrencyCoinDetailsBloc
    extends Bloc<CurrencyCoinDetailsEvent, CurrencyCoinDetailsState> {
  CurrencyCoinDetailsBloc(this.coinsRepository)
      : super(const CurrencyCoinDetailsState()) {
    on<LoadCurrencyCoinDetails>(_load);
  }

  final AbstractCerrenciesRepository coinsRepository;

  Future<void> _load(
    LoadCurrencyCoinDetails event,
    Emitter<CurrencyCoinDetailsState> emit,
  ) async {
    try {
      if (state is! CurrencyCoinDetailsLoaded) {
        emit(const CurrencyCoinDetailsLoading());
      }

      final coin = await coinsRepository.getCoinsList();
    } catch (e, st) {
      emit(CurrencyCoinDetailsLoadingFailure(e));
    }
  }
}

// class CerrenciesListBloc
//     extends Bloc<CerrenciesListEvent, CerrenciesListState> {
//   CerrenciesListBloc(this.coinsRepository) : super(CerrenciesListInitial()) {
//     on<LoadCerrenciesList>(((event, emit) async {
//       try {
//         if (state is! CerrenciesListLoaded) {
//           emit(CerrenciesListLoading());
//         }
//         final coinsList = await coinsRepository.getCoinsList();
//         emit((CerrenciesListLoaded(coinsList: coinsList)));
//       } catch (e) {
//         emit(CerrenciesListLoadingFuilure(exception: e));
//       } finally {
//         event.completer?.complete();
//       }
//     }));
//   }

//   final AbstractCerrenciesRepository coinsRepository;
// }
