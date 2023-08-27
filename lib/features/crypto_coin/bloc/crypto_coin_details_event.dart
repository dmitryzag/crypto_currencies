part of 'crypto_coin_details_bloc.dart';

sealed class CryptoCoinDetailsEvent extends Equatable {}

class CryptoCoinDetailsInitialEvent extends CryptoCoinDetailsEvent {
  @override
  List<Object> get props => [];
}
