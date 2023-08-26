import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CryptoCoinCard extends StatelessWidget {
  const CryptoCoinCard({
    super.key,
    required this.coinName,
  });

  final String coinName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
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
    );
  }
}
