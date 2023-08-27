import 'package:crypto_coins_list/features/crypto_list/bloc/crypto_coins_list_bloc.dart';
import 'package:crypto_coins_list/features/crypto_list/crypto_list.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins.dart';
import 'package:crypto_coins_list/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  final _cryptoCoinsListBloc =
      CryptoCoinsListBloc(GetIt.I<AbstractCoinsRepository>());
  @override
  void initState() {
    _cryptoCoinsListBloc.add(CryptoInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Currenciest List'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          _cryptoCoinsListBloc.add(CryptoInitialEvent());
        },
        child: BlocBuilder<CryptoCoinsListBloc, CryptoCoinsListState>(
          bloc: _cryptoCoinsListBloc,
          builder: (context, state) {
            if (state is CryptoCoinsListLoaded) {
              return ListView.builder(
                  padding: const EdgeInsets.only(top: 15),
                  itemCount: state.coinsList.length,
                  itemBuilder: (context, i) {
                    final coin = state.coinsList[i];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CryptoCoinCard(cryptoCoin: coin),
                    );
                  });
            }
            if (state is CryptoCoinsListLoadingFailure) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Ошибка загрузки криптовалют'),
                    const SizedBox(height: 20),
                    Text(
                      'Пожалуйста попробуйте снова',
                      style: theme.textTheme.labelSmall,
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                        onPressed: () {
                          _cryptoCoinsListBloc.add(CryptoInitialEvent());
                        },
                        child: const Text('Попробовать снова'))
                  ],
                ),
              );
            }
            if (state is CryptoCoinsListLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
