import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const CryptoCoinsList());
}

class CryptoCoinsList extends StatelessWidget {
  const CryptoCoinsList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const CryptoListScreen(),
        '/coin': (context) => const CryptoCoinScreen(),
      },
      debugShowCheckedModeBanner: false,
      title: 'CryptoCurrenciestList',
      theme: ThemeData(
        cardTheme: const CardTheme(color: Color.fromARGB(255, 184, 140, 5)),
        dividerColor: Colors.white24,
        scaffoldBackgroundColor: const Color.fromARGB(255, 32, 31, 31),
        listTileTheme: const ListTileThemeData(
            textColor: Colors.white, iconColor: Colors.white),
        textTheme: const TextTheme(
            bodyMedium: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
            labelSmall: TextStyle(
              color: Color.fromARGB(106, 255, 255, 255),
              fontWeight: FontWeight.w500,
              fontSize: 14,
            )),
        appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 32, 31, 31),
            shadowColor: Colors.amber,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            iconTheme: IconThemeData(color: Colors.white),
            centerTitle: true),
        primarySwatch: Colors.amber,
        useMaterial3: true,
      ),
    );
  }
}

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Currenciest List'),
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, i) {
            String coinName = 'Bitcoin';
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  leading: SvgPicture.asset(
                    'assets/images/bitcoin.svg',
                    height: 40,
                    width: 40,
                  ),
                  title: Text(
                    coinName,
                    style: theme.textTheme.bodyMedium,
                  ),
                  subtitle: Text(
                    '203020\$',
                    style: theme.textTheme.labelSmall,
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      '/coin',
                      arguments: coinName,
                    );
                  },
                ),
              ),
            );
          }),
    );
  }
}

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  String? coinName;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null || args is String, 'You must provide String');
    coinName = args as String;
    super.didChangeDependencies();
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(coinName ?? '...'),
      ),
    );
  }
}
