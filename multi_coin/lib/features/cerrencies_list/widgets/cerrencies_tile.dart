import 'package:flutter/material.dart';
import 'package:multi_coin/repositories/models/cerrencies_model.dart';

class CerrenciesCoinTile extends StatelessWidget {
  const CerrenciesCoinTile({
    super.key,
    required this.coin,
  });

  final CurrencyCoin coin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      title: Text(coin.name, style: theme.textTheme.bodyMedium),
      subtitle: Text('${coin.price} \₽', style: theme.textTheme.labelSmall),
      trailing: const Icon(
        Icons.arrow_forward_ios,
      ),
      onTap: () {
        Navigator.of(context).pushNamed(
          '/currency',
          arguments: coin,
        );
      },
    );
  }
}
