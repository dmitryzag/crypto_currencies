import 'package:crypto_coins_list/theme/theme.dart';
import 'package:flutter/material.dart';

class PriceCard extends StatelessWidget {
  const PriceCard({super.key, required this.priceInUSD});
  final double priceInUSD;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      color: const Color.fromARGB(56, 0, 0, 0),
      child: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Text(
          '$priceInUSD \$',
          style: theme.textTheme.bodyLarge,
        ),
      )),
    );
  }
}
