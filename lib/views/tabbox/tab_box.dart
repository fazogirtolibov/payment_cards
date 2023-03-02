import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:last_exam/cubit/tab/tab_cubit.dart';
import 'package:last_exam/views/tabbox/cards_page/cards_page.dart';
import 'package:last_exam/views/tabbox/home_page/home_page.dart';
import 'package:last_exam/views/tabbox/settings_page/settings_page.dart';

import '../../utils/app_icons.dart';
import '../../utils/color.dart';

class TabBox extends StatefulWidget {
  const TabBox({super.key});

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  List<Widget> screens = [];

  @override
  void initState() {
    screens.add(const HomePage());
    screens.add(const CardsPage());
    screens.add(const SettingsPage());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabboxCubit, int>(
      builder: (context, state) {
        var index = context.watch<TabboxCubit>().activePageIndex;
        return Scaffold(
          body: screens[index],
          bottomNavigationBar: BottomNavigationBar(
            iconSize: 24,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            type: BottomNavigationBarType.fixed,
            onTap: (value) =>
                BlocProvider.of<TabboxCubit>(context).changePageIndex(value),
            items: [
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    const SizedBox(height: 10),
                    SvgPicture.asset(AppIcons.homeIcon,
                        color: index == 0
                            ? MyColors.LightishGreen
                            : MyColors.LightishGrey),
                  ],
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppIcons.materialsIcon,
                    color: index == 1
                        ? MyColors.LightishGreen
                        : MyColors.LightishGrey,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppIcons.profileIcon,
                  color: index == 2
                      ? MyColors.LightishGreen
                      : MyColors.LightishGrey,
                ),
                label: "",
              ),
            ],
          ),
        );
      },
    );
  }
}
