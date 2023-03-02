import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:last_exam/utils/color.dart';

import '../../blocs/card_bloc/bloc/card_bloc.dart';
import '../../data/models/card_model/card_model.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/global_button.dart';
import '../../widgets/my_text_field.dart';

// ignore: must_be_immutable
class UpdateCardPage extends StatefulWidget {
  UpdateCardPage({Key? key, required this.cardModel}) : super(key: key);
  CardModel cardModel;
  @override
  State<UpdateCardPage> createState() => _UpdateCardPageState();
}

TextEditingController nameController = TextEditingController();
Color currentColor = MyColors.LightishGreen;
Color pickerColor = const Color.fromARGB(255, 255, 255, 255);
bool booleanFirst = false;
bool booleanSecond = false;

class _UpdateCardPageState extends State<UpdateCardPage> {
  @override
  void initState() {
    nameController.text = widget.cardModel.cardHolder;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Update Card Page',
        widget: Container(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 220.h,
                width: double.infinity,
                child: Stack(children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 380,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.51),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            const Color(0xffff4b1f),
                            Color(
                              hexColor(
                                booleanFirst == false
                                    ? widget.cardModel.color
                                    : pickerColor.toString().substring(10, 16),
                              ),
                            ),
                          ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                            top: 10, left: 34, bottom: 26, right: 20)
                        .r,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Plastic Card",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(color: MyColors.white),
                            ),
                            Container(
                              width: 80.w,
                              height: 50.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12).r,
                                image: DecorationImage(
                                    image: AssetImage(
                                        widget.cardModel.iconImage.toString()),
                                    fit: BoxFit.cover),
                              ),
                            )
                          ],
                        ),
                        const Spacer(),
                        Text(
                          widget.cardModel.cardNumber.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: MyColors.white),
                        ),
                        const Spacer(),
                        SizedBox(
                          height: 8.h,
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Card Holder name",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(color: MyColors.white),
                                ),
                                SizedBox(
                                  height: 9.h,
                                ),
                                SizedBox(
                                  width: 86.w,
                                  child: Text(
                                    booleanSecond == false
                                        ? widget.cardModel.cardHolder.toString()
                                        : nameController.text,
                                    maxLines: 2,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(color: MyColors.white),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(width: 50.w),
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
                                SizedBox(
                                  height: 9.h,
                                ),
                                Text(widget.cardModel.expireDate.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(color: MyColors.white)),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ]),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                height: 40.h,
                child: GlobalButton(
                  isActive: true,
                  buttonText: 'color edit',
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
                                  setState(() {
                                    currentColor = pickerColor;
                                    booleanFirst = true;
                                  });

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
              SizedBox(
                height: 20.h,
              ),
              MyTextField(
                onChanged: (v) {
                  setState(() {
                    booleanSecond = true;
                  });
                },
                controller: nameController,
                textInputType: TextInputType.text,
                text: 'Full name',
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                width: 380.w,
                child: GlobalButton(
                  isActive: nameController.text != '',
                  buttonText: 'Update Card',
                  onTap: () async {
                    BlocProvider.of<CardBloc>(context).add(
                      UpdateCard(
                          docId: widget.cardModel.id,
                          color: pickerColor.toString().replaceRange(0, 10, ''),
                          cardHolder: nameController.text),
                    );
                    nameController.clear();
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  hexColor(String colorhexcode) {
    String colornew = '0xff$colorhexcode';
    colornew = colornew.replaceAll(")", "");
    int colorint = int.parse(colornew);
    return colorint;
  }
}
