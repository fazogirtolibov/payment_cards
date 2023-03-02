import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:last_exam/cubit/get_cards/get_card_cubit.dart';
import 'package:last_exam/cubit/get_cards/get_card_state.dart';
import 'package:last_exam/utils/constants.dart';
import 'package:last_exam/utils/my_utils.dart';
import 'package:last_exam/widgets/custom_appbar.dart';

import '../../../blocs/card_bloc/bloc/card_bloc.dart';
import '../../../utils/color.dart';

class CardsPage extends StatefulWidget {
  const CardsPage({super.key});

  @override
  State<CardsPage> createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: 'Your Cards',
          widget: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, addCardPage);
            },
            icon: const Icon(Icons.add),
          )),
      body: BlocBuilder<GetCardCubit, GetCardState>(builder: (context, state) {
        if (state is LoadCardInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is LoadCardInSuccess) {
          return ListView.builder(
              itemCount: state.cardModel.length,
              itemBuilder: (BuildContext context, int index) {
                var item = state.cardModel[index];
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, updateCardPage,
                          arguments: {'cardModel': item});
                    },
                    child: SizedBox(
                      height: myHeight(context) * 0.26,
                      width: double.infinity,
                      child: Stack(children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.51),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                const Color(0xffff4b1f),
                                Color(MyUtils.hexColor(
                                    state.cardModel[index].color)),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                                  top: 10, left: 36, bottom: 20, right: 20)
                              .r,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Plastic Card",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium!
                                          .copyWith(color: MyColors.white)),
                                  Container(
                                    width: 80.w,
                                    height: 50.h,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12).r,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                item.iconImage.toString()),
                                            fit: BoxFit.cover)),
                                  )
                                ],
                              ),
                              const Spacer(),
                              Text(item.cardNumber.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(color: MyColors.white)),
                              const Spacer(),
                              SizedBox(
                                height: 8.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        child: Text(item.cardHolder.toString(),
                                            maxLines: 2,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                    color: MyColors.white)),
                                      )
                                    ],
                                  ),
                                  const SizedBox(width: 50),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Expiry Date",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(color: MyColors.white)),
                                      SizedBox(
                                        height: 9.h,
                                      ),
                                      Text(item.expireDate.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(color: MyColors.white))
                                    ],
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: const Text(
                                                "You sure, delete?",
                                              ),
                                              actions: [
                                                CupertinoDialogAction(
                                                  child: const Text("no"),
                                                  onPressed: () {
                                                    setState(() {});
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                                CupertinoDialogAction(
                                                  child: const Text(
                                                    "yes",
                                                  ),
                                                  onPressed: () {
                                                    BlocProvider.of<CardBloc>(
                                                            context)
                                                        .add(DeleteCard(
                                                            docId: state
                                                                .cardModel[
                                                                    index]
                                                                .id));
                                                    Navigator.pop(context);
                                                  },
                                                )
                                              ],
                                            );
                                          });
                                    },
                                    icon: const Icon(
                                      Icons.delete_outline,
                                      size: 30,
                                      color: MyColors.neutral7,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ),
                );
              });
        }
        return const Center(
          child: Text('return'),
        );
      }),
    );
  }
}
