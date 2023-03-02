import 'package:flutter/material.dart';
import 'package:last_exam/views/payment_page.dart/widget/payment_input_format.dart';
import 'package:last_exam/widgets/global_button.dart';

import '../../widgets/custom_appbar.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

String moneyAmount = '';

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Payment Page',
        widget: Container(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            PaymentInputFormat(
              paymentInputFormat: (paymentInputFormat) {
                setState(() {
                  moneyAmount = paymentInputFormat;
                });
              },
              initialValue: '',
            ),
            const SizedBox(height: 10),
            GlobalButton(
              isActive: moneyAmount.length == 5,
              buttonText: "Send Money",
              onTap: () {
                Navigator.pop(context);
                moneyAmount = '';
              },
            )
          ],
        ),
      ),
    );
  }
}
