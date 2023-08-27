part of 'crypto_coin_details_bloc.dart';

sealed class CryptoCoinDetailsState extends Equatable {
  const CryptoCoinDetailsState();

  @override
  List<Object> get props => [];
}

final class CryptoCoinDetailsInitial extends CryptoCoinDetailsState {
  @override
  List<Object> get props => [];
}

class CryptoCoinLoaded extends CryptoCoinDetailsState {
  final CryptoCoinDetail coin;

  const CryptoCoinLoaded({required this.coin});
  @override
  List<Object> get props => [coin];
}

class CryptoCoinLoadedFailure extends CryptoCoinDetailsState {
  final Object error;

  const CryptoCoinLoadedFailure({required this.error});

  @override
  List<Object> get props => [error];
}

class CryptoCoinLoading extends CryptoCoinDetailsState {
  @override
  List<Object> get props => [];
}
