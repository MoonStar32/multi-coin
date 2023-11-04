import 'models/cerrencies_model.dart';

abstract class AbstractCerrenciesRepository {
  Future<List<CurrencyCoin>> getCoinsList();
}
