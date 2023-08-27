import 'package:flutter/material.dart';

class DetailCard extends StatelessWidget {
  final double highestPrice;
  final double lowestPrice;

  const DetailCard(
      {super.key, required this.highestPrice, required this.lowestPrice});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      color: const Color.fromARGB(56, 0, 0, 0),
      child: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Highest for 24 Hour'),
                Text('$highestPrice \$')
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Lowest for 24 Hour'),
                Text('$lowestPrice \$')
              ],
            ),
          ],
        ),
      )),
    );
  }
}
