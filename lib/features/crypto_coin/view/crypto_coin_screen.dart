import 'package:crypto_coins_list/features/crypto_coin/crypto_coin.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins.dart';
import 'package:crypto_coins_list/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  late CryptoCoinDetailsBloc _cryptoCoinsListBloc;
  late CryptoCoin coin;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    coin = ModalRoute.of(context)?.settings.arguments as CryptoCoin;
    _cryptoCoinsListBloc =
        CryptoCoinDetailsBloc(GetIt.I<AbstractCoinsRepository>(), coin.name);
    _cryptoCoinsListBloc.add(CryptoCoinDetailsInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<CryptoCoinDetailsBloc, CryptoCoinDetailsState>(
        bloc: _cryptoCoinsListBloc,
        builder: (context, state) {
          if (state is CryptoCoinLoaded) {
            return Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: Image.network(
                      state.coin.imageURL,
                      width: 150,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Text(
                    state.coin.coinName,
                    style: theme.textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 15),
                  PriceCard(priceInUSD: state.coin.priceInUSD),
                  const SizedBox(height: 25),
                  DetailCard(
                      highestPrice: state.coin.highestPrice,
                      lowestPrice: state.coin.lowestPrice)
                ],
              ),
            );
          }
          if (state is CryptoCoinLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container();
        },
      ),
    );
  }
}
