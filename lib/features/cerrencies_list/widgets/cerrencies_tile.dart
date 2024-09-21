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
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.fromLTRB(12, 0, 10, 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: theme.cardColor,
          boxShadow: [
            BoxShadow(
              color: theme.shadowColor,
            ),
          ],
        ),
        child: ListTile(
          title: Text(
            coin.name,
            style: theme.textTheme.bodyMedium,
          ),
          leading: Text(
            coin.sense,
            style: theme.textTheme.bodyMedium,
          ),
          subtitle: Text(
            '${coin.price} ₽',
            style: theme.textTheme.labelSmall,
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
          ),
          onTap: () {
            Navigator.of(context).pushNamed(
              '/currency',
              arguments: coin,
            );
          },
        ),
      ),
    );
  }
}
