import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/models/models.dart';
import 'package:meta/meta.dart';

part 'crypto_coins_list_event.dart';
part 'crypto_coins_list_state.dart';

class CryptoCoinsListBloc
    extends Bloc<CryptoCoinsListEvent, CryptoCoinsListState> {
  CryptoCoinsListBloc(this.coinsRepository) : super(CryptoCoinsListInitial()) {
    on<CryptoInitialEvent>((event, emit) async {
      try {
        if (state is! CryptoCoinsListLoaded) {
          emit(CryptoCoinsListLoading());
        }
        final cryptoCoinsList = await coinsRepository.getCoinsList();
        emit(CryptoCoinsListLoaded(coinsList: cryptoCoinsList));
      } catch (e) {
        emit(CryptoCoinsListLoadingFailure(error: e));
      }
    });
  }

  final AbstractCoinsRepository coinsRepository;
}
