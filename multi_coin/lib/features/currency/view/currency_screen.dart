import 'package:flutter/material.dart';
import 'package:multi_coin/repositories/models/cerrencies_model.dart';

class CurrencyScreen extends StatefulWidget {
  const CurrencyScreen({super.key});

  @override
  State<CurrencyScreen> createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  CurrencyCoin? coin;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(
        args != null && args is CurrencyCoin, "'You must provide String args");

    coin = args as CurrencyCoin;
    setState(() {
      super.didChangeDependencies();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
