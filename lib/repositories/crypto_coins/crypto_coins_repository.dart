import 'package:dio/dio.dart';
import 'crypto_coins.dart';

class CryptoCoinsRepository implements AbstractCoinsRepository {
  CryptoCoinsRepository({required this.dio});
  final Dio dio;

  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await Dio().get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,AVAX,BMX,TON,AID&tsyms=USD,EUR,RUB');

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
}
