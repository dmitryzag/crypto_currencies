part of 'crypto_coins_list_bloc.dart';

@immutable
sealed class CryptoCoinsListEvent extends Equatable {}

class CryptoInitialEvent extends CryptoCoinsListEvent {
  final Completer? completer;

  CryptoInitialEvent({this.completer});

  @override
  List<Object?> get props => throw UnimplementedError();
}
