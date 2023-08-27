part of 'crypto_coins_list_bloc.dart';

@immutable
sealed class CryptoCoinsListState extends Equatable {}

final class CryptoCoinsListInitial extends CryptoCoinsListState {
  @override
  List<Object?> get props => [];
}

class CryptoCoinsListLoading extends CryptoCoinsListState {
  @override
  List<Object?> get props => [];
}

class CryptoCoinsListLoaded extends CryptoCoinsListState {
  final List<CryptoCoin> coinsList;

  CryptoCoinsListLoaded({required this.coinsList});

  @override
  List<Object?> get props => [coinsList];
}

class CryptoCoinsListLoadingFailure extends CryptoCoinsListState {
  final Object? error;

  CryptoCoinsListLoadingFailure({required this.error});

  @override
  List<Object?> get props => [error];
}
