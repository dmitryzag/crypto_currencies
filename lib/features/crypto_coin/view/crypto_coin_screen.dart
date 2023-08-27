import 'package:crypto_coins_list/features/crypto_coin/bloc/crypto_coin_details_bloc.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins.dart';
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
      appBar: AppBar(
        title: Text('...'),
      ),
      body: BlocBuilder<CryptoCoinDetailsBloc, CryptoCoinDetailsState>(
        bloc: _cryptoCoinsListBloc,
        builder: (context, state) {
          print(state);
          if (state is CryptoCoinLoaded) {
            return Text(state.coin.coinName);
          }
          return Container();
        },
      ),
    );
  }
}
