import 'abstract_cerrencies_lrepository.dart';
import 'models/cerrencies_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:connectivity/connectivity.dart';
import 'dart:async';

class CerrenciesRepository implements AbstractCerrenciesRepository {
  static const String cacheKey = 'currency_coins';
  static const int cacheDurationInHours = 6;

  @override
  Future<List<CurrencyCoin>> getCoinsList() async {
    final prefs = await SharedPreferences.getInstance();
    final savedCoinsJsonList = prefs.getStringList(cacheKey);
    final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.none &&
        savedCoinsJsonList != null) {
      // Если нет доступа в интернет и есть сохраненные данные, десериализуем их
      final savedCoins = savedCoinsJsonList
          .map(
            (coinJson) => CurrencyCoin.fromJson(
              json.decode(coinJson),
            ),
          )
          .toList();
      return savedCoins;
    } else {
      final response = await http.get(
        Uri.parse('https://www.cbr-xml-daily.ru/daily_json.js'),
      );
      final Map<String, dynamic> data = json.decode(response.body);
      final Map<String, dynamic> dataRaw = data["Valute"];
      final cerrenciesCoinsList = dataRaw.entries.map(
        (e) {
          final Map<String, dynamic> valute = e.value;
          final price = valute["Value"];
          return CurrencyCoin(
            name: e.value["Name"],
            price: price.toDouble(),
            sense: e.key,
          );
        },
      ).toList();

      // Сохраняем полученные данные в SharedPreferences
      final coinsJsonList = cerrenciesCoinsList
          .map(
            (coin) => json.encode(
              coin.toJson(),
            ),
          )
          .toList();
      await prefs.setStringList(
        cacheKey,
        coinsJsonList,
      );

      // Устанавливаем таймер для очистки кэша через 6 часов
      Timer(
        const Duration(hours: cacheDurationInHours),
        () {
          prefs.remove(cacheKey);
        },
      );

      return cerrenciesCoinsList;
    }
  }
}
