import 'package:flutter/material.dart';

import 'routes/routes.dart';
import 'theme/theme.dart';

class CryptoCoinsList extends StatelessWidget {
  const CryptoCoinsList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      debugShowCheckedModeBanner: false,
      title: 'CryptoCurrenciestList',
      theme: theme,
    );
  }
}
