import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:last_exam/utils/color.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PaymentInputFormat extends StatefulWidget {
  const PaymentInputFormat(
      {Key? key, required this.paymentInputFormat, required this.initialValue})
      : super(key: key);

  final ValueChanged<String> paymentInputFormat;
  final String initialValue;

  @override
  _PaymentInputFormatState createState() => _PaymentInputFormatState();
}

class _PaymentInputFormatState extends State<PaymentInputFormat> {
  late MaskTextInputFormatter cardMaskInputFormatterPayment;
  final FocusNode cardFocusNode = FocusNode();
  final TextEditingController controller = TextEditingController();
  @override
  void initState() {
    cardMaskInputFormatterPayment = MaskTextInputFormatter(
      mask: '### ### ###',
      filter: {
        '#': RegExp(r'[0-9]'),
      },
    );
    controller.text =
        cardMaskInputFormatterPayment.maskText(widget.initialValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 20),
              Text('Enter amount of money',
                  style: GoogleFonts.raleway().copyWith(fontSize: 16)),
              Text("*",
                  style: GoogleFonts.raleway().copyWith(color: MyColors.error)),
            ],
          ),
          const SizedBox(height: 10),
          Material(
            borderRadius: BorderRadius.circular(30),
            child: TextFormField(
              focusNode: cardFocusNode,
              keyboardType: const TextInputType.numberWithOptions(
                  signed: false, decimal: true),
              inputFormatters: [cardMaskInputFormatterPayment],
              onChanged: (v) {
                if (v.length == 5) {
                  widget.paymentInputFormat.call(v);
                }
              },
              style: GoogleFonts.raleway()
                  .copyWith(fontWeight: FontWeight.w600, fontSize: 16),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Enter amount of money',
                contentPadding: const EdgeInsets.only(left: 20),
                hintStyle: GoogleFonts.raleway()
                    .copyWith(color: MyColors.neutral7, fontSize: 16),
                border: const OutlineInputBorder(),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(color: MyColors.neutral8),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(color: MyColors.primary, width: 2),
                ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  borderSide: BorderSide(color: MyColors.error),
                ),
                errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  borderSide: BorderSide(color: MyColors.error),
                ),
              ),
              cursorColor: MyColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
