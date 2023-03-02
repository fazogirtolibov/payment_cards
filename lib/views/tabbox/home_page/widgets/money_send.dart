import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:last_exam/utils/constants.dart';

import '../../../../utils/color.dart';

class MoneySendWidget extends StatelessWidget {
  const MoneySendWidget({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);
  final String text;
  final String icon;
  final bool pressAttention = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, paymentPage);
      },
      child: Container(
        width: myWidth(context) * 0.2,
        height: myHeight(context) * 0.13,
        // padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          border: Border.all(color: MyColors.LightishGrey),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(icon),
            const SizedBox(height: 10),
            Text(
              text,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
