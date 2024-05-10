import 'package:flutter/material.dart';
import 'package:multi_coin/features/currency/widgets/cerrencies_tile.dart';
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
        appBar: AppBar(
          title: const Text('Coin'),
        ),
        body: Column(
          children: [
            BaseCard(
                child: Center(
              child: BaseCard(
                child: Center(
                  child: Text(
                    coin!.sense,
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            )),
            BaseCard(
                child: Center(
              child: BaseCard(
                child: Center(
                  child: Text(
                    coin!.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            )),
            BaseCard(
              child: Center(
                child: Text(
                  '${coin!.price} ₽',
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
