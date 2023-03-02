import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:last_exam/cubit/get_cards/get_card_cubit.dart';
import 'package:last_exam/utils/app_icons.dart';
import 'package:last_exam/utils/color.dart';
import 'package:last_exam/utils/constants.dart';
import 'package:last_exam/views/tabbox/home_page/widgets/money_send.dart';
import 'package:last_exam/widgets/custom_appbar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../cubit/get_cards/get_card_state.dart';
import '../../../utils/my_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static var random = Random();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List userName = [
    'Jedi',
    'SkyWalker',
    'Kenobi',
    'Mandalorian',
    'Grogu',
    'Andor',
  ];

  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Your Wallet',
        widget: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, notificationsPage);
          },
          icon: const Icon(Icons.notifications_outlined),
        ),
      ),
      body: BlocBuilder<GetCardCubit, GetCardState>(
        builder: (context, state) {
          if (state is LoadCardInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadCardInSuccess) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: myHeight(context) * 0.26,
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.cardModel.length,
                      controller: _controller,
                      itemBuilder: (BuildContext context, int index) {
                        var item = state.cardModel[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
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
                                        top: 10,
                                        left: 34,
                                        bottom: 26,
                                        right: 30)
                                    .r,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                            borderRadius:
                                                BorderRadius.circular(12).r,
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    item.iconImage.toString()),
                                                fit: BoxFit.cover),
                                          ),
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
                                    SizedBox(height: 8.h),
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
                                                  .copyWith(
                                                      color: MyColors.white),
                                            ),
                                            SizedBox(height: 9.h),
                                            SizedBox(
                                              width: 86.w,
                                              child: Text(
                                                  item.cardHolder.toString(),
                                                  maxLines: 2,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
                                                      .copyWith(
                                                          color:
                                                              MyColors.white)),
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
                                                    .copyWith(
                                                        color: MyColors.white)),
                                            SizedBox(
                                              height: 9.h,
                                            ),
                                            Text(item.expireDate.toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge!
                                                    .copyWith(
                                                        color: MyColors.white))
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ]),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 25),
                  SmoothPageIndicator(
                    controller: _controller,
                    count: state.cardModel.length,
                    effect: const ExpandingDotsEffect(
                        activeDotColor: MyColors.primary),
                  ),
                  const SizedBox(height: 40),
                  Text('Actions',
                      style: Theme.of(context).textTheme.headlineSmall),
                  SizedBox(height: myHeight(context) * 0.016),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      MoneySendWidget(
                        text: 'Send',
                        icon: AppIcons.sendMoney,
                      ),
                      SizedBox(width: 10),
                      MoneySendWidget(
                        text: 'Bills',
                        icon: AppIcons.bills,
                      ),
                      SizedBox(width: 10),
                      MoneySendWidget(
                        text: 'Topup',
                        icon: AppIcons.topUp,
                      ),
                      SizedBox(width: 10),
                      MoneySendWidget(
                        text: 'More',
                        icon: AppIcons.more,
                      ),
                    ],
                  ),
                  SizedBox(height: myHeight(context) * 0.04),
                  Text('Recents',
                      style: Theme.of(context).textTheme.headlineSmall),
                  SizedBox(height: myHeight(context) * 0.01),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, paymentPage);
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 6),
                                height: myHeight(context) * 0.14,
                                width: myWidth(context) * 0.23,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "https://xsgames.co/randomusers/assets/avatars/male/${HomePage.random.nextInt(50)}.jpg"),
                                  ),
                                  shape: BoxShape.circle,
                                  color: Colors.teal,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                userName[index],
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: Text('return'),
          );
        },
      ),
    );
  }
}
