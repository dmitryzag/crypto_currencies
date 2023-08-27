import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins.dart';
import 'package:equatable/equatable.dart';

part 'crypto_coin_details_event.dart';
part 'crypto_coin_details_state.dart';

class CryptoCoinDetailsBloc
    extends Bloc<CryptoCoinDetailsEvent, CryptoCoinDetailsState> {
  CryptoCoinDetailsBloc(this.coinsRepository, this.cryptoName)
      : super(CryptoCoinDetailsInitial()) {
    on<CryptoCoinDetailsInitialEvent>((event, emit) async {
      try {
        if (state is! CryptoCoinLoaded) {
          emit(CryptoCoinLoading());
        }
        final coin = await coinsRepository.getCoinDetail(cryptoName);
        emit(CryptoCoinLoaded(coin: coin));
      } catch (e) {
        emit(CryptoCoinLoadedFailure(error: e));
      }
    });
  }
  final AbstractCoinsRepository coinsRepository;
  final String cryptoName;
}
