import 'abstract_cerrencies_lrepository.dart';

import 'models/cerrencies_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CerrenciesRepository implements AbstractCerrenciesRepository {
  @override
  Future<List<CurrencyCoin>> getCoinsList() async {
    final response =
        await http.get(Uri.parse('https://www.cbr-xml-daily.ru/daily_json.js'));

    final Map<String, dynamic> data = json.decode(response.body);
    final Map<String, dynamic> dataRaw = data["Valute"];
    final cerrenciesCoinsList = dataRaw.entries.map((e) {
      final Map<String, dynamic> valute = e.value;
      final price = valute["Value"];
      return CurrencyCoin(
          name: e.value["Name"], price: price.toDouble(), sense: e.key);
    }).toList();
    return cerrenciesCoinsList;
  }
}
