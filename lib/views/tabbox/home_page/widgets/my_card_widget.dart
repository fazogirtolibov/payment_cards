import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final double balance;
  final int cardNumber;
  final int expiryMonth;
  final int expiryYear;
  final color;

  const MyCard(
      {Key? key,
      required this.balance,
      required this.cardNumber,
      required this.expiryMonth,
      required this.expiryYear,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              'Balance',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '\$$balance',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //card number
                Text(
                  cardNumber.toString(),
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                //card expiry date
                Text(
                  '$expiryMonth/$expiryYear',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
