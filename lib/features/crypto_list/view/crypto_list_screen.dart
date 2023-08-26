import 'package:flutter/material.dart';

import '../widgets/crypto_coin_card.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Currenciest List'),
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, i) {
            String coinName = 'Bitcoin';
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: CryptoCoinCard(coinName: coinName),
            );
          }),
    );
  }
}
