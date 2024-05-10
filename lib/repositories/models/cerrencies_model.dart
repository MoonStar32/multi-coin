import 'package:equatable/equatable.dart';

class CurrencyCoin extends Equatable {
  const CurrencyCoin(
      {required this.name, required this.price, required this.sense});

  final String name;
  final double price;
  final String sense;

  factory CurrencyCoin.fromJson(Map<String, dynamic> json) {
    return CurrencyCoin(
      name: json['name'],
      price: json['price'].toDouble(),
      sense: json['sense'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'sense': sense,
    };
  }

  @override
  List<Object> get props => [name, price, sense];
}
