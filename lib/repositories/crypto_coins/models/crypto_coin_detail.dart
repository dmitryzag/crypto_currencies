import 'package:equatable/equatable.dart';

class CryptoCoinDetail extends Equatable {
  final String imageURL;
  final double priceInUSD;
  final String coinName;
  final double highestPrice;
  final double lowestPrice;

  const CryptoCoinDetail(
      {required this.imageURL,
      required this.priceInUSD,
      required this.coinName,
      required this.highestPrice,
      required this.lowestPrice});

  @override
  List<Object?> get props =>
      [imageURL, priceInUSD, coinName, highestPrice, lowestPrice];
}
