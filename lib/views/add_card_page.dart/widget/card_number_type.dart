import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:last_exam/utils/color.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CardNumberType extends StatefulWidget {
  const CardNumberType(
      {Key? key, required this.cardNumberType, required this.initialValue})
      : super(key: key);

  final ValueChanged<String> cardNumberType;
  final String initialValue;

  @override
  // ignore: library_private_types_in_public_api
  _CardNumberTypeState createState() => _CardNumberTypeState();
}

class _CardNumberTypeState extends State<CardNumberType> {
  late MaskTextInputFormatter cardMaskInputFormatterExpiry;
  final FocusNode cardFocusNode = FocusNode();
  final TextEditingController controller = TextEditingController();
  @override
  void initState() {
    cardMaskInputFormatterExpiry = MaskTextInputFormatter(
      mask: '#### #### #### ####',
      filter: {
        '#': RegExp(r'[0-9]'),
      },
    );
    controller.text =
        cardMaskInputFormatterExpiry.maskText(widget.initialValue);
    super.initState();
  }

  @override
  void dispose() {
    cardFocusNode.dispose();
    super.dispose();
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
              Text('Card Number',
                  style: GoogleFonts.raleway().copyWith(fontSize: 16)),
              Text("*",
                  style: GoogleFonts.raleway().copyWith(color: MyColors.error)),
            ],
          ),
          const SizedBox(height: 10),
          Material(
            borderRadius: BorderRadius.circular(30),
            child: TextFormField(
              inputFormatters: [cardMaskInputFormatterExpiry],
              focusNode: cardFocusNode,
              keyboardType: const TextInputType.numberWithOptions(
                  signed: false, decimal: true),
              onChanged: (v) {
                widget.cardNumberType.call(v);
                if (v.length == 19) {
                  cardFocusNode.unfocus();
                }
              },
              style: GoogleFonts.raleway()
                  .copyWith(fontWeight: FontWeight.w600, fontSize: 16),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Card Number',
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
