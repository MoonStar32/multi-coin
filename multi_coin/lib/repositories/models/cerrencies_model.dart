import 'package:equatable/equatable.dart';

class CurrencyCoin extends Equatable {
  const CurrencyCoin(
      {required this.name, required this.price, required this.sense});

  final String name;
  final double price;
  final String sense;

  @override
  List<Object> get props => [name, price, sense];
}
