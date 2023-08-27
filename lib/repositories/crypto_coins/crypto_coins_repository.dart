import 'package:dio/dio.dart';
import 'crypto_coins.dart';

class CryptoCoinsRepository implements AbstractCoinsRepository {
  CryptoCoinsRepository({required this.dio});
  final Dio dio;

  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await Dio().get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,AVAX,BMXAID&tsyms=USD,EUR,RUB');

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final cryptoCoinsList = dataRaw.entries.map((coin) {
      final usdData =
          (coin.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final priceToUSD = usdData['PRICE'];
      final imageURL = usdData['IMAGEURL'];
      return CryptoCoin(
          name: coin.key,
          priceToUSD: priceToUSD,
          imageURL: 'https://www.cryptocompare.com/$imageURL');
    });
    return cryptoCoinsList.toList();
  }

  @override
  Future<CryptoCoinDetail> getCoinDetail(String currencyCode) async {
    final response = await Dio().get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$currencyCode&tsyms=USD');

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final coinDetail = dataRaw.entries.map((coin) {
      final usdData =
          (coin.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final price = usdData['PRICE'];
      final imageURL = usdData['IMAGEURL'];
      final highestPrice = usdData['HIGH24HOUR'];
      final lowestPrice = usdData['LOW24HOUR'];
      return CryptoCoinDetail(
        coinName: coin.key,
        highestPrice: highestPrice,
        imageURL: 'https://www.cryptocompare.com/$imageURL',
        lowestPrice: lowestPrice,
        priceInUSD: price,
      );
    });
    return coinDetail.first;
  }
}
