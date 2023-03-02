import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:last_exam/utils/color.dart';
import 'package:last_exam/utils/constants.dart';
import 'package:last_exam/views/add_card_page.dart/widget/card_expire_type.dart';
import 'package:last_exam/views/add_card_page.dart/widget/card_number_type.dart';
import 'package:last_exam/views/add_card_page.dart/widget/dropdown_widget.dart';

import '../../blocs/card_bloc/bloc/card_bloc.dart';
import '../../data/models/card_model/card_model.dart';
import '../../utils/app_images.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/global_button.dart';
import '../../widgets/my_text_field.dart';

class AddCardPage extends StatefulWidget {
  const AddCardPage({super.key});

  @override
  State<AddCardPage> createState() => _AddCardPageState();
}

TextEditingController nameController = TextEditingController();

String expiryDate = '';
String cardNumber = '';
String dropdownValue = 'UzCard';

var cards = [
  AppImages.uzCardLogo,
  AppImages.humoCardLogo,
];

Color currentColor = MyColors.LightishGreen;
Color pickerColor = const Color.fromARGB(255, 255, 255, 255);

class _AddCardPageState extends State<AddCardPage> {
  @override
  void dispose() {
    nameController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Add Card Page',
        widget: Container(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 4),
          child: Column(
            children: [
              SizedBox(
                height: myHeight(context) * 0.26,
                width: double.infinity,
                child: Stack(children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            const Color.fromARGB(255, 219, 97, 10),
                            pickerColor,
                          ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10, left: 34, bottom: 26, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Plastic Card",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(color: MyColors.white)),
                            Container(
                              width: 80,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12).r,
                                image: DecorationImage(
                                    image: AssetImage(dropdownValue.length == 6
                                        ? AppImages.uzCardLogo
                                        : dropdownValue.length == 4
                                            ? AppImages.humoCardLogo
                                            : AppImages.uzCardLogo),
                                    fit: BoxFit.cover),
                              ),
                            )
                          ],
                        ),
                        const Spacer(),
                        Text(
                          cardNumber.isEmpty
                              ? 'xxxx xxxx xxxx xxxx'
                              : cardNumber.length == 19
                                  ? cardNumber.replaceRange(5, 14, '**** ****')
                                  : cardNumber,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: MyColors.white),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Card Holder Name",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(color: MyColors.white),
                                ),
                                const SizedBox(height: 9),
                                SizedBox(
                                  child: Text(
                                    nameController.text,
                                    maxLines: 2,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(color: MyColors.white),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Expiry Date",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(color: MyColors.white),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  expiryDate,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(color: MyColors.white),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ]),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: SizedBox(
                  height: 40,
                  child: GlobalButton(
                    isActive: true,
                    buttonText: 'Color edit',
                    onTap: () {
                      showDialog(
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Pick a color!'),
                              content: SingleChildScrollView(
                                child: ColorPicker(
                                  pickerColor: pickerColor,
                                  onColorChanged: changeColor,
                                ),
                              ),
                              actions: <Widget>[
                                ElevatedButton(
                                  child: const Text('Got it'),
                                  onPressed: () {
                                    setState(() => currentColor = pickerColor);
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                          context: context);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              MyTextField(
                onChanged: (v) {
                  setState(() {});
                },
                controller: nameController,
                textInputType: TextInputType.text,
                text: 'Full name',
              ),
              SizedBox(
                height: 24.h,
              ),
              CardNumberType(
                  cardNumberType: (value) {
                    setState(() {
                      cardNumber = value;
                    });
                  },
                  initialValue: ''),
              SizedBox(
                height: 20.h,
              ),
              CardInputExpiryDate(
                  cardExpiryDate: (cardExpiryDate) {
                    setState(() {
                      expiryDate = cardExpiryDate;
                    });
                  },
                  initialValue: ''),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 0.0).r,
                child: const Dropdown(),
              ),
              // SizedBox(height: 20.h),
              GlobalButton(
                isActive: expiryDate.length == 5 &&
                    cardNumber.length == 19 &&
                    dropdownValue.isNotEmpty &&
                    nameController.text != '',
                buttonText: 'Add Card',
                onTap: () {
                  CardModel cardModel = CardModel(
                    id: '',
                    color: pickerColor.toString().replaceRange(0, 10, ''),
                    cardNumber: cardNumber,
                    cardHolder: nameController.text,
                    expireDate: expiryDate,
                    iconImage: dropdownValue.length == 6
                        ? AppImages.uzCardLogo
                        : dropdownValue.length == 4
                            ? AppImages.humoCardLogo
                            : AppImages.uzCardLogo,
                    cardType: dropdownValue,
                  );
                  BlocProvider.of<CardBloc>(context)
                      .add(AddCard(cardModel: cardModel));
                  nameController.clear();
                  Navigator.pop(context);
                  cardNumber = '';
                  expiryDate = '';
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }
}
