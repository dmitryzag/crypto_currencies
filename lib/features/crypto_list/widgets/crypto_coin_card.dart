import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin.dart';
import 'package:flutter/material.dart';

class CryptoCoinCard extends StatelessWidget {
  const CryptoCoinCard({
    super.key,
    required this.cryptoCoin,
  });

  final CryptoCoin cryptoCoin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: ListTile(
        leading: Image.network(cryptoCoin.imageURL),
        title: Text(
          cryptoCoin.name,
          style: theme.textTheme.bodyMedium,
        ),
        subtitle: Text(
          '${cryptoCoin.priceToUSD}\$',
          style: theme.textTheme.labelSmall,
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.of(context).pushNamed(
            '/coin',
            arguments: cryptoCoin,
          );
        },
      ),
    );
  }
}
