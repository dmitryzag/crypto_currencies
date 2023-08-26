import '../features/crypto_coin/view/view.dart';
import '../features/crypto_list/view/view.dart';

final routes = {
  '/': (context) => const CryptoListScreen(),
  '/coin': (context) => const CryptoCoinScreen(),
};
