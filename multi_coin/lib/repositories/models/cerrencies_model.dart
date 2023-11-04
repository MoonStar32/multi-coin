import 'package:equatable/equatable.dart';

class CurrencyCoin extends Equatable {
  const CurrencyCoin({required this.name, required this.price});

  final String name;
  final double price;

  @override
  List<Object> get props => [name, price];
}
