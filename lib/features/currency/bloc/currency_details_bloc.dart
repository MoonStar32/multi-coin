import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:multi_coin/repositories/abstract_cerrencies_lrepository.dart';
import 'package:multi_coin/repositories/models/cerrencies_model.dart';

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
        emit(
          const CurrencyCoinDetailsLoading(),
        );
      }
    } catch (e) {
      emit(
        CurrencyCoinDetailsLoadingFailure(e),
      );
    }
  }
}
