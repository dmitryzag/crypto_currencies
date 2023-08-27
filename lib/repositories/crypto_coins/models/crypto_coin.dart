import 'package:equatable/equatable.dart';

class CryptoCoin extends Equatable {
  final String name;
  final double priceToUSD;
  final String imageURL;

  const CryptoCoin(
      {required this.name, required this.priceToUSD, required this.imageURL});

  @override
  List<Object?> get props => [name, priceToUSD, imageURL];
}
